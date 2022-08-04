{ hash
, sha256 ? null
}:
let
  url = "https://github.com/NixOS/nixpkgs/archive/${hash}.tar.gz";
  inputs =
    if sha256 != null
    then { inherit url sha256; }
    else { inherit url; };
in
import (fetchTarball inputs) { }
