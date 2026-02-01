{ ... }:

{
  services.keyd = {
    enable = true;
    keyboards.default = {
      settings = {
        main = {
          leftmeta = "layer(mac)";
          rightalt = "rightmeta";
        };

        mac = {
          a = "C-a";
          b = "C-b";
          c = "C-c";
          f = "C-f";
          h = "C-h";
          i = "C-i";
          j = "C-j";
          k = "C-k";
          l = "C-l";
          n = "C-n";
          o = "C-o";
          p = "C-p";
          q = "A-f4";
          r = "C-r";
          s = "C-s";
          t = "C-t";
          u = "C-u";
          v = "C-v";
          w = "C-w";
          x = "C-x";
          z = "C-z";
          enter = "C-enter";
          "`" = "C-`";
          "-" = "C--";
          equal = "C-equal";
          left = "home";
          right = "end";
          up = "C-home";
          down = "C-end";
        };

        "mac+shift" = {
          "[" = "C-S-[";
          "]" = "C-S-]";
        };
      };
    };
  };
}
