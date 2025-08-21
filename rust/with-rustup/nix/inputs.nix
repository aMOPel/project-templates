{
  system ? builtins.currentSystem,
}:
let
  sources = import ./sources.nix;
  pkgs = import sources.nixpkgs { };
in
{
  inherit pkgs;
}
