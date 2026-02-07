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
          "1" = "C-1";
          "2" = "C-2";
          "3" = "C-3";
          "4" = "C-4";
          "5" = "C-5";
          "6" = "C-6";
          "7" = "C-7";
          "8" = "C-8";
          "9" = "C-9";
          "0" = "C-0";
          enter = "C-enter";
          "`" = "C-`";
          "-" = "C--";
          equal = "C-equal";
          "/" = "C-/";
          left = "home";
          right = "end";
          up = "C-home";
          down = "C-end";
        };

        "mac+shift" = {
          "[" = "C-S-[";
          "]" = "C-S-]";
        };

        "mac+alt" = {
          left = "C-A-left";
          right = "C-A-right";
        };
      };
    };
  };
}
