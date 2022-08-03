{ use-hash ? true }:

let
  pkgs-hash = { hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d"; };
  pkgs-flake = { flake-path = ./test-flake.lock; };

  input =
    if use-hash
    then pkgs-hash
    else pkgs-flake;

  pkgs = (import ../default.nix).pkgs-hash-or-flake input;
in
pkgs.mkShell { }
