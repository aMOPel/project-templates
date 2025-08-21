{
  pkgs,
}@inputs:
let
  shells = {
    root = pkgs.callPackage ./root/shell.nix { };
  };
in
{
  inherit shells;
}
