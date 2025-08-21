{
  system ? builtins.currentSystem,
}:
let
  inputs = import ./nix/inputs.nix { inherit system; };
  outputs = import ./nix/outputs.nix inputs;
in
outputs
