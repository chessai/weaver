{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  weaver = (
    with rec {
      weaverSource = pkgs.lib.cleanSource ../.;
      weaverBasic  = self.callCabal2nix "weaver" weaverSource { };
    };
    overrideCabal weaverBasic (old: {
    })
  );
}
