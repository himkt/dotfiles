# Tool Discovery

All agents and teammates MUST actively discover and use available tools for optimal task execution.

1. **Skills**: Check the system-reminder for available skills. Use matching skills
   (e.g., `/pathfinder-explain` for symbol tracing, `/github-cli` for GitHub URLs).
2. **MCP servers**: Check for `mcp__*` tools in your available tool list.
   Use them based on their descriptions for tasks like code navigation,
   browser automation, and verification.
3. **CLI tools**: Use project-appropriate CLI tools via Bash when MCP alternatives
   aren't available.

When a better tool exists for a task, use it. Prefer MCP tools and skills over
manual alternatives.
