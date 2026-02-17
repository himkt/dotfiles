{ ... }:

{
  services.keyd = {
    enable = true;
    keyboards.default = {
      settings = {
        main = {
          capslock = "leftcontrol";
        };
        control = {
          q = "A-f4";
          left = "home";
          right = "end";
          up = "C-home";
          down = "C-end";
        };
      };
    };
  };
}
