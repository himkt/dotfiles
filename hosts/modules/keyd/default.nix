{ ... }:

{
  services.keyd = {
    enable = true;
    keyboards.default = {
      settings = {
        main = {
          leftmeta = "layer(mac)";
          rightmeta = "layer(mac)";
        };

        "mac:C" = {
          a = "a";
          c = "c";
          v = "v";
          x = "x";
          z = "z";
          s = "s";
          o = "o";
          n = "n";
          p = "p";
          f = "f";
          h = "h";
          t = "t";
          w = "w";
          r = "r";
          l = "l";
          b = "b";
          i = "i";
          u = "u";
        };

        "mac:C-S" = {
          z = "z";
          t = "t";
        };
      };
    };
  };
}
