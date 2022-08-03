{ test ? "hash" }:

let
  pkgs-hash = (import ../default.nix).pkgs-hash-or-flake { hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d"; };
  pkgs-flake = (import ../default.nix).pkgs-hash-or-flake { flake-path = ./test-flake.lock; };

  pkgs =
    if test == "hash"
    then pkgs-hash
    else
      if test == "flake"
      then pkgs-flake
      else throw "Expected 'hash' or 'flake' for arg 'test', received ${test}";
in
pkgs.mkShell { }
