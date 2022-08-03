<div align="center">

# Nix Utils

[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/tbidne/nix-utils?include_prereleases&sort=semver)](https://github.com/tbidne/nix-utils/releases/)
[![MIT](https://img.shields.io/github/license/tbidne/nix-utils?color=blue)](https://opensource.org/licenses/MIT)
[![build](https://img.shields.io/github/workflow/status/tbidne/nix-utils/ci/main)](https://github.com/tbidne/nix-utils/actions/workflows/ci.yaml)

</div>

---

### Table of Contents
* [Functions](#functions)
  * [pkgs-hash-or-flake](#pkgs-hash-or-flake)
  * [pkgs-hash](#pkgs-hash)
  * [pkgs-flake](#pkgs-flake)

# Functions

## pkgs-hash-or-flake

**Args:** attr set containing a string `hash` and/or a path `flake-path` to `flake.lock`.

**Description:** If `hash` is present and non-null, returns the `nixpkgs` corresponding to this hash. Otherwise returns the root `nixpkgs` in the `flake.lock` found at the given `flake-path`. Throws an error if neither is given.

**Examples:**
```nix
pkgs-hash-or-flake { hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d"; }

pkgs-hash-or-flake { flake-path = ./flake.lock; }
```

## pkgs-hash

**Args:** String `hash`.

**Description:** Retrieves the `nixpkgs` corresponding to the given hash.

**Examples:**

```nix
pkgs-hash "b39924fc7764c08ae3b51beef9a3518c414cdb7d"
```

## pkgs-flake

**Args:** Path `path`.

**Description:** Retrieves the root `nixpkgs` in the `flake.lock` found at the given `path`. Throws an error if neither is given.

**Examples:**

```nix
pkgs-flake ./flake.lock
```