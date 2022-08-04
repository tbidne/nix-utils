{ flake-path
, extra ? { }
}:

let
  add-non-null = (import ./null-utils.nix).add-non-null;

  lockJson = builtins.fromJSON (builtins.readFile flake-path);
  nixpkgs-key = lockJson.nodes.root.inputs.nixpkgs;
  flake-hash = lockJson.nodes.${nixpkgs-key}.locked.rev;
  flake-sha256 = lockJson.nodes.${nixpkgs-key}.locked.narHash;
in
import
  (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${flake-hash}.tar.gz";
    sha256 = flake-sha256;
  })
  extra
