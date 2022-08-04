{ use-hash ? true
, with-sha ? false
}:

let
  add-non-nulls = (import ../lib/null-utils.nix).add-non-nulls;

  hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d";
  flake-path = ./test-flake.lock;
  sha = "1yivdc9k1qcr29yxq9pz4qs2i29wgxj5y550kp0lz2wzp45ksi1x";

  base =
    if use-hash
    then { inherit hash; }
    else { inherit flake-path; };

  others = [
    { key = "sha256"; val = if with-sha then sha else null; }
  ];

  inputs = add-non-nulls base others;

  pkgs = (import ../default.nix).pkgs-hash-or-flake inputs;
in
pkgs.mkShell { }
