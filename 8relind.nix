{ pkgs ? import <nixpkgs> { } }:

with pkgs;

stdenv.mkDerivation {
  pname = "8relind";
  version = "v1.1.0";

  src = fetchFromGitHub {
    owner = "SequentMicrosystems";
    repo = "8relind-rpi";
    rev = "d8c48c7";
    sha256 = "Evvf5dy36zY9s9gXnjvODJDGCGe1VUOa2Q1GkkrvwJM=";
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
    cp 8relind $out/bin/8relind
  '';
}
