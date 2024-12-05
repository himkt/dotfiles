{
  description = "My templates of nix";

  outputs = { self, ... }:
  {
    templates = {
      devenv-uv = {
        path = ./nix/template.d/devenv-uv;
        description = "devenv template with uv";
      };
    };
  };
}
