{ with-system ? false
}:

let
  add-non-null = (import ../lib/null-utils.nix).add-non-null;
  system = if with-system then "x86_64-linux" else null;

  inputs = add-non-null { flake-path = ./test-flake.lock; } "system" system;

  pkgs = (import ../default.nix).pkgs-flake inputs;
in
pkgs.mkShell { }
