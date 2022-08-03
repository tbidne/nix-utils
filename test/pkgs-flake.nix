let
  pkgs = (import ../default.nix).pkgs-flake ./test-flake.lock;
in
pkgs.mkShell { }
