{
  description = "Provides nix utilities.";
  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };
  outputs =
    { flake-compat, self }:
    let
      null-utils = import lib/null-utils.nix;
    in
    {
      pkgs-hash = import lib/pkgs-hash.nix;
      pkgs-flake = import lib/pkgs-flake.nix;
      pkgs-hash-or-flake = import lib/pkgs-hash-or-flake.nix;

      add-non-null = null-utils.add-non-null;
      add-non-nulls = null-utils.add-non-nulls;
    };
}
