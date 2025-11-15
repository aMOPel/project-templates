let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };

  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-full
      ;
  };

  # configure jabref brave browser plugin
  jabrefBravePluginConfig = ''
    {
      "name": "org.jabref.jabref",
      "description": "JabRef",
      "path": "${pkgs.jabref}/lib/jabrefHost.py",
      "type": "stdio",
      "allowed_origins": [
        "chrome-extension://bifehkofibaamoeaopjglfkddgkijdlh/",
        "chrome-extension://pgkajmkfgbehiomipedjhoddkejohfna/"
      ]
    }
  '';
  jabrefBravePluginConfigPath = "~/.config/BraveSoftware/Brave-Browser/NativeMessagingHosts/org.jabref.jabref.json";

in
pkgs.mkShell {
  packages = with pkgs; [
    jabref
    kdePackages.okular
    tex
  ];
  shellHook = ''
    mkdir -p "$(dirname ${jabrefBravePluginConfigPath})"
    echo '${jabrefBravePluginConfig}' > ${jabrefBravePluginConfigPath}

    # for latex arial font
    export OSFONTDIR="${pkgs.corefonts}/share/fonts/truetype":"$OSFONTDIR"
  '';
}
