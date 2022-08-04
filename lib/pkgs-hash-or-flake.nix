{ hash ? null
, sha256 ? null
, flake-path ? null
, extra ? { }
}:

let
  pkgs-hash = import ./pkgs-hash.nix;
  pkgs-flake = import ./pkgs-flake.nix;
in
if hash != null
then pkgs-hash { inherit hash sha256 extra; }
else pkgs-flake { inherit flake-path extra; }
