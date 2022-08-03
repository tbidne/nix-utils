{
  description = "Nix Utils";
  outputs =
    { self }:
    let
      flake-hash = path:
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
      pkgs-hash = hash: import
        (fetchTarball {
          url = "https://github.com/NixOS/nixpkgs/archive/${hash}.tar.gz";
        })
        { };
    in
    {
      inherit
        flake-hash
        pkgs-hash;

      hash-or-flake = input:
        if input ? hash && input.hash != null
        then pkgs-hash input.hash
        else if input ? flake-path && input.flake-path != null
        then flake-hash input.flake-path
        else throw "hash-or-flake: One of hash or flake-path must be defined and non-null";
    };
}
