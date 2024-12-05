{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "uv";
  version = "0.5.6";

  src = pkgs.fetchurl {
    url = "https://github.com/astral-sh/uv/releases/download/0.5.6/uv-x86_64-apple-darwin.tar.gz";
    sha256 = "sha256-nEXSCeWr3PpCqkTPRW32wJUrnXGbAdnJ54eIaxelCA4=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp uv $out/bin/
  '';

  meta = with pkgs.lib; {
    description = "An extremely fast Python package and project manager, written in Rust.";
    homepage = "https://github.com/astral-sh/uv";
    license = licenses.mit;
    platforms = platforms.x86_64;
  };
}
