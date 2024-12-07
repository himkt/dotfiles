{ ... }:

{
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}

      config.keys = {}
      config.scrollback_lines = 9999999

      -- Use the defaults as a base
      config.hyperlink_rules = wezterm.default_hyperlink_rules()

      -- Font
      config.font = wezterm.font 'JetBrains Mono NL'
      config.font_size = 16.0

      -- https://wezfurlong.org/wezterm/colorschemes/g/index.html
      config.color_scheme = 'Guezwhoz'
      config.colors = {cursor_bg = 'cyan', cursor_fg = 'black'}
      config.default_cursor_style = 'SteadyUnderline'
      config.window_background_opacity = 0.8

      -- skip confirmation prompt when quitting app
      config.window_close_confirmation = 'NeverPrompt'

      -- fullscreen shortcut
      config.native_macos_fullscreen_mode = true
      config.keys[1] = {
        key    = 'f',
        mods   = 'CMD|CTRL',
        action = wezterm.action.ToggleFullScreen,
      }
      config.keys[2] = {
        key    = 'Enter',
        mods   = 'CMD',
        action = wezterm.action.ToggleFullScreen,
      }

      return config
    '';
  };
}
