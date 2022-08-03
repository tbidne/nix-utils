{
  description = "Provides nix utilities.";
  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };
  outputs =
    { flake-compat, self }:
    let
      # Retrieves nixpkgs from the given flake.lock.
      pkgs-flake = path:
        let
          lockJson = builtins.fromJSON (builtins.readFile path);
          nixpkgs-key = lockJson.nodes.root.inputs.nixpkgs;
          flake-hash = lockJson.nodes.${nixpkgs-key}.locked.rev;
        in
        import
          (fetchTarball {
            url = "https://github.com/NixOS/nixpkgs/archive/${flake-hash}.tar.gz";
          })
          { };
      # Retrieves nixpkgs from the given hash.
      pkgs-hash = hash: import
        (fetchTarball {
          url = "https://github.com/NixOS/nixpkgs/archive/${hash}.tar.gz";
        })
        { };
    in
    {
      inherit
        pkgs-flake
        pkgs-hash;

      # Retrieves nixpkgs from either the provided hash or flake.lock path.
      # Prioritizes the hash if it exists. This is useful when we want to
      # default to using the same nixpkgs as defined in a flake, but retain
      # the ability to override it.
      pkgs-hash-or-flake = input:
        if input ? hash && input.hash != null
        then pkgs-hash input.hash
        else if input ? flake-path && input.flake-path != null
        then pkgs-flake input.flake-path
        else throw "hash-or-flake: One of hash or flake-path must be defined and non-null";
    };
}
