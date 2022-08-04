{ hash
, sha256 ? null
, extra ? {}
}:
let
  add-non-null = (import ./null-utils.nix).add-non-null;
  url = "https://github.com/NixOS/nixpkgs/archive/${hash}.tar.gz";
  inputs = add-non-null { inherit url; } "sha256" sha256;
in
import (fetchTarball inputs) extra
