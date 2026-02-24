{
  config,
  pkgs,
  lib,
  ...
}:

let
  claudeFiles = ./files;
in

{
  home.file = {
    # Top-level files
    ".claude/CLAUDE.md".source = claudeFiles + "/CLAUDE.md";
    ".claude/README.md".source = claudeFiles + "/README.md";
    ".claude/settings.json".source = claudeFiles + "/settings.json";
    ".claude/.mcp.json".source = claudeFiles + "/.mcp.json";

    # Directories
    ".claude/agents".source = claudeFiles + "/agents";
    ".claude/bin".source = claudeFiles + "/bin";
    ".claude/rules".source = claudeFiles + "/rules";
    ".claude/skills".source = claudeFiles + "/skills";
  };
}
