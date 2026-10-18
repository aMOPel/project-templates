{
}:
let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };

  # for communication with https://github.com/R-nvim/R.nvim
  # needs to injected into rEnv of project
  nvimcom = pkgs.rPackages.buildRPackage {
    name = "nvimcom";
    src = "${pkgs.vimPlugins.R-nvim}/nvimcom";
    nativeBuildInputs = [
      pkgs.gcc
      pkgs.gnumake
    ];
  };

  rEnv = pkgs.rWrapper.override {
    packages = with pkgs.rPackages; [
      devtools
      nvimcom
    ];
  };

  inherit (pkgs) mkShellNoCC;
in
mkShellNoCC {
  packages = [
    rEnv
  ];
  shellHook = "";
}
