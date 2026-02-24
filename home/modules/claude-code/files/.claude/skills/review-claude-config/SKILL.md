---
name: review-claude-config
description: Review ~/.claude configuration against the latest Claude Code features and best practices, then suggest updates.
context: fork
allowed-tools: Read, Edit, Write, Glob, Grep, Bash, WebFetch, WebSearch
---

# Review Config

Review the `~/.claude` configuration directory against the latest Claude Code documentation and changelog, then report findings and apply updates with user approval.

## Data Sources

Gather information from all of the following before starting the review:

1. **claude-code-guide agent**: Use `Task` tool with `subagent_type=claude-code-guide` to query official Claude Code documentation for specific topics (permissions, settings, hooks, etc.)
2. **Changelog**: https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md
3. **Official docs**: https://code.claude.com/docs

## Review Checklist

### 1. settings.json

- Are there deprecated or removed settings?
- Are there new useful settings not yet enabled?
- Are setting values still optimal? (e.g., model defaults, permission modes)

### 2. CLAUDE.md (global)

- Is the structure following best practices?
- Are instructions clear and not conflicting?
- Is there outdated guidance referencing old features?

### 3. .claude/CLAUDE.md (project)

- Does the directory structure section accurately reflect the repo?
- Are project-specific conventions still valid?

### 4. agents/

- Do agent definitions use current frontmatter schema?
- Are tool allowlists up-to-date with available tools?
- Are there agents that could benefit from new capabilities?

### 5. skills/

- Do skill definitions use current frontmatter schema?
- Are there new built-in features that make any custom skills redundant?
- Are `allowed-tools` lists current?

### 6. New features

- Are there newly released features (hooks, MCP servers, new settings, etc.) that could benefit this setup?

## Output Format

Present findings as a structured report:

```markdown
## Config Review Report

### Summary
(One-line overall assessment)

### Findings

#### [Critical] ...
(Settings that are broken or deprecated)

#### [Recommended] ...
(Improvements worth making)

#### [Info] ...
(New features available but not urgent)

### Proposed Changes
(List each file change with before/after)
```

## Instructions

1. Fetch and analyze all data sources listed above
2. Read all configuration files in `~/.claude/`
3. Compare current config against latest documentation
4. Generate the review report
5. Ask for user approval before applying any changes
6. Apply approved changes

## Important

- Never remove user customizations without explicit approval
- Preserve the separation between global (CLAUDE.md) and project (.claude/CLAUDE.md) settings
- When in doubt, flag as [Info] rather than auto-fixing
