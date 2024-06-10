{ pkgs ? import <nixpkgs> { } }:

with pkgs;

stdenv.mkDerivation {
  pname = "megaind";
  version = "v1.1.5";

  src = fetchFromGitHub {
    owner = "SequentMicrosystems";
    repo = "megaind-rpi";
    rev = "672b150";
    sha256 = "8iYLFO2OwZ7pccpjhFjV+BSWcd41HaHzijJ/mLTJ+Qw=";
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
    cp megaind $out/bin/megaind
  '';
}
