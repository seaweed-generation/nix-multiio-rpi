{ pkgs ? import <nixpkgs> { } }:

with pkgs;

stdenv.mkDerivation {
  pname = "multiio";
  version = "v1.0.1";

  src = fetchFromGitHub {
    owner = "SequentMicrosystems";
    repo = "multiio-rpi";
    rev = "8364373";
    sha256 = "HRFBr1x/okS3TBazwvVBkORmwiMZ7tdSkVyH6DiRy1w=";
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
    cp multiio $out/bin/multiio
  '';
}
