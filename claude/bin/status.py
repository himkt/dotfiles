#!/usr/bin/env python3
import json
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Any, Optional


@dataclass(frozen=True)
class TokenUsage:
    input_tokens: int = 0
    output_tokens: int = 0
    cache_creation_input_tokens: int = 0
    cache_read_input_tokens: int = 0

    @property
    def total(self) -> int:
        return sum(
            (
                self.input_tokens,
                self.output_tokens,
                self.cache_creation_input_tokens,
                self.cache_read_input_tokens,
            )
        )


def find_transcript_file(session_id: str) -> Optional[Path]:
    projects_dir = Path.home() / ".claude" / "projects"
    if not projects_dir.exists():
        return None

    for project_dir in projects_dir.iterdir():
        if project_dir.is_dir():
            transcript_file = project_dir / f"{session_id}.jsonl"
            if transcript_file.exists():
                return transcript_file
    return None


def read_token_usage(transcript_file: Path) -> TokenUsage:
    last_usage: Optional[Dict[str, Any]] = None

    try:
        with open(transcript_file, "r", encoding="utf-8") as file:
            for line in file:
                try:
                    entry = json.loads(line.strip())
                    # Only assistant messages contain cumulative usage data
                    if entry.get("type") == "assistant" and entry.get(
                        "message", {}
                    ).get("usage"):
                        last_usage = entry["message"]["usage"]
                except json.JSONDecodeError:
                    continue
    except (IOError, OSError):
        return TokenUsage()

    if not last_usage:
        return TokenUsage()

    return TokenUsage(
        input_tokens=last_usage.get("input_tokens", 0),
        output_tokens=last_usage.get("output_tokens", 0),
        cache_creation_input_tokens=last_usage.get("cache_creation_input_tokens", 0),
        cache_read_input_tokens=last_usage.get("cache_read_input_tokens", 0),
    )


def format_token_count(tokens: int) -> str:
    if tokens >= 1_000_000:
        return f"{tokens / 1_000_000:.1f}M"
    elif tokens >= 1_000:
        return f"{tokens / 1_000:.1f}K"
    return str(tokens)


def get_color(percentage: int) -> str:
    if percentage >= 90:
        return "\x1b[31m"  # Red
    elif percentage >= 70:
        return "\x1b[33m"  # Yellow
    return "\x1b[32m"  # Green


def main() -> None:
    try:
        data = json.loads(sys.stdin.read())

        # Extract session info
        model = data.get("model", {}).get("display_name", "Unknown")
        current_dir = Path(
            data.get("workspace", {}).get("current_dir") or data.get("cwd", ".")
        ).name
        session_id = data.get("session_id")

        token_usage = TokenUsage()
        if session_id:
            if transcript_file := find_transcript_file(session_id):
                token_usage = read_token_usage(transcript_file)

        threshold = int(200000 * 0.8)
        percentage = min(100, round((token_usage.total / threshold) * 100))
        token_display = format_token_count(token_usage.total)
        color = get_color(percentage)

        print(
            f"[{model}] 📁 {current_dir} | 🪙 {token_display} | {color}{percentage}%\x1b[0m"
        )

    except Exception:
        print("[Error] 📁 . | 🪙 0 | 0%")


if __name__ == "__main__":
    main()
