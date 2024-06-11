{ pkgs ? import <nixpkgs> { } }:

with pkgs;

stdenv.mkDerivation {
  pname = "4relind";
  version = "v1.1.1";

  src = fetchFromGitHub {
    owner = "SequentMicrosystems";
    repo = "4relind-rpi";
    rev = "79f1b99";
    sha256 = "RQtkj8X61cJNm7hYs4KUYzBxUWtcxXwFl9oHVhkdFyE=";
  };

  buildInputs = [
    gnumake
    pkg-config
    libxcrypt
  ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp 4relind $out/bin/4relind
  '';
}
