{ with-sha ? false
}:

let
  add-non-nulls = (import ../lib/null-utils.nix).add-non-nulls;

  hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d";
  sha256 = "1yivdc9k1qcr29yxq9pz4qs2i29wgxj5y550kp0lz2wzp45ksi1x";

  others = [
    { key = "sha256"; val = if with-sha then sha256 else null; }
  ];

  inputs = add-non-nulls ({ inherit hash; }) others;

  pkgs = (import ../default.nix).pkgs-hash inputs;
in
pkgs.mkShell { }
