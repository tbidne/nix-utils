let
  pkgs = (import ../default.nix).pkgs-hash "b39924fc7764c08ae3b51beef9a3518c414cdb7d";
in
pkgs.mkShell { }
