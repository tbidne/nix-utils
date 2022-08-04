let
  pkgs = (import ../default.nix).pkgs-flake { flake-path = ./test-flake.lock; };
in
pkgs.mkShell { }
