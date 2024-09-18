{ pkgs ? import <nixpkgs> { } }:

with pkgs;

stdenv.mkDerivation {
  pname = "rtd";
  version = "v1.0.0";

  src = fetchFromGitHub {
    owner = "SequentMicrosystems";
    repo = "rtd-rpi";
    rev = "d4a500f899b87b3ce1f31d9436fdf68857b36cb5";
    sha256 = "jO10yVciRMtSf7v0CCTlNNkkWe+xRU96w4C/et1qfMU=";
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
    cp rtd $out/bin/rtd
  '';
}
