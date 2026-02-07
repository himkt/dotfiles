{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
}:

stdenv.mkDerivation rec {
  pname = "pathfinder";
  version = "0.1.0";

  src = fetchurl {
    url = "https://github.com/himkt/pathfinder/releases/download/v${version}/pathfinder-x86_64-unknown-linux-gnu.tar.gz";
    sha256 = "18bpvh651i1nk4agkxqqaax22y0fa3nwpfhhanlprzprq08cdvdk";
  };

  nativeBuildInputs = [ autoPatchelfHook ];

  sourceRoot = ".";

  installPhase = ''
    install -Dm755 pathfinder $out/bin/pathfinder
  '';

  meta = with lib; {
    description = "MCP client for jumping to definitions using LSP server";
    homepage = "https://github.com/himkt/pathfinder";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
  };
}
