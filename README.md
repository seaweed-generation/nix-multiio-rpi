# Sequented Nix

A Nix wrapper around some https://github.com/SequentMicrosystems projects, such as multiio and megaind

## Usage

### NixOS module

You can include this in a standard NixOS install by using `pkgs.callPackage`:

```nix
{ pkgs, ... }:

let
  src = builtins.fetchGit {
    url = "git@github.com:seaweed-generation/sequented-nix.git";
    ref = "main";
  };

  multiio = pkgs.callPackage "${src}/multiio.nix" { };
in
{
  environment.systemPackages = [ multiio ];
}
```

### Flake

You can also use it in a flake, an incomplete example would be:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    sequented = { url = "github:seaweed-generation/sequented-nix"; flake = false; };
  };
  outputs = inputs: with inputs;
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system overlays;
          };

          multiio = pkgs.callPackage "${inputs.sequented}/multiio.nix" { };
        in
        {
          devShells.default = mkShell {
            packages = [ multiio ];
          };
        }
      );
}

```
