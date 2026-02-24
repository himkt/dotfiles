#!/usr/bin/env python3
import json
import sys

RESET = "\x1b[0m"
DIM = "\x1b[2m"
RED = "\x1b[31m"
YELLOW = "\x1b[33m"
GREEN = "\x1b[32m"


def format_tokens(tokens: int) -> str:
    if tokens >= 1_000_000:
        return f"{tokens / 1_000_000:.1f}M"
    if tokens >= 1_000:
        return f"{tokens / 1_000:.1f}K"
    return str(tokens)


def context_color(percentage: int) -> str:
    if percentage >= 90:
        return RED
    if percentage >= 70:
        return YELLOW
    return GREEN


def main() -> None:
    data = json.loads(sys.stdin.read())
    model = data["model"]["display_name"]
    cwd = data["workspace"]["current_dir"]
    cost = data["cost"]["total_cost_usd"]

    elements = [
        f"{DIM}{model}{RESET}",
        f"📁 {cwd}",
        f"💰 ${cost:.4f}",
    ]

    try:
        tokens = sum(data["context_window"]["current_usage"].values())
        pct = data["context_window"]["used_percentage"]
        color = context_color(pct)
        elements.append(f"{color}📊 {format_tokens(tokens)} ({pct}%){RESET}")
    except Exception as e:
        pass  # NOTE(himkt): usage metrics not available on startup.

    print(f" {DIM}|{RESET} ".join(elements))


if __name__ == "__main__":
    main()
