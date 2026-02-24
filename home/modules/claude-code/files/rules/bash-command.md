# Bash Command

Rules to ensure Bash commands match `permissions.allow` patterns in settings.json.
Using shell operators breaks pattern matching and triggers user approval prompts that block work.

- NEVER use `&&` or `;` to chain commands. Each command must be a separate Bash tool call
- NEVER use redirects (`>`, `>>`, `<`). Use the Write tool for file output
- NEVER use command substitution (`$()` or backticks) unless absolutely unavoidable
- When you need to work in a specific directory, run `cd /path/to/dir` as a separate Bash call FIRST, then run subsequent commands in separate Bash calls (the working directory persists between Bash calls)
