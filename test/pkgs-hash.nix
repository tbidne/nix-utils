{ with-sha ? false }:

let
  hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d";
  sha256 = "1yivdc9k1qcr29yxq9pz4qs2i29wgxj5y550kp0lz2wzp45ksi1x";
  inputs =
    if with-sha
    then { inherit hash sha256; }
    else { inherit hash; };
  pkgs = (import ../default.nix).pkgs-hash inputs;
in
pkgs.mkShell { }
