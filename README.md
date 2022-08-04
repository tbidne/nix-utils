<div align="center">

# Nix Utils

[![GitHub release (latest SemVer)](https://img.shields.io/github/v/tag/tbidne/nix-utils?include_prereleases&sort=semver)](https://github.com/tbidne/nix-utils/releases/)
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

**Args:** Attr set containing up to:

* String `hash`
* String `sha256`
* Path `flake-path` to `flake.lock`

**Description:** If `hash` is present and non-null, returns the `nixpkgs` corresponding to this hash. The optional `sha256` is the expected value for this `nixpkgs`. Otherwise returns the root `nixpkgs` in the `flake.lock` found at the given `flake-path`. Throws an error if neither is given.

**Examples:**
```nix
pkgs-hash-or-flake { hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d"; }

pkgs-hash-or-flake {
  hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d";
  sha256 = "1yivdc9k1qcr29yxq9pz4qs2i29wgxj5y550kp0lz2wzp45ksi1x";
}

pkgs-hash-or-flake { flake-path = ./flake.lock; }
```

## pkgs-hash

**Args:** Attr set containing:

* String `hash`
* String `sha256` (optional)

**Description:** Retrieves the `nixpkgs` corresponding to the given hash. The optional `sha256` is the expected value for this `nixpkgs`.

**Examples:**

```nix
pkgs-hash {hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d"; }

pkgs-hash {
  hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d";
  sha256 = "1yivdc9k1qcr29yxq9pz4qs2i29wgxj5y550kp0lz2wzp45ksi1x";
}
```

## pkgs-flake

**Args:** Path.

**Description:** Retrieves the root `nixpkgs` in the `flake.lock` found at the given path.

**Examples:**

```nix
pkgs-flake ./flake.lock
```