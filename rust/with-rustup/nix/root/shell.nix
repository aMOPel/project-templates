{
  rustup,
  mkShellNoCC,
}:
let
  rootPath = builtins.toString ../../.;
  rustupConfig = builtins.fromTOML (builtins.readFile "${rootPath}/rust-toolchain.toml");
  rustChannel = rustupConfig.toolchain.channel or "stable";
in
mkShellNoCC {
  packages = [
    rustup
  ];
  shellHook = ''

    # make rustup and cargo dirs local
    export RUSTUP_HOME="${rootPath}/.rustup";
    export CARGO_HOME="${rootPath}/.cargo";

    # put rustup and cargo bins on PATH
    export PATH=$CARGO_HOME/bin:$PATH;
    for dir in $RUSTUP_HOME/toolchains/${rustChannel}*/bin/; do PATH="$dir:$PATH"; done
    export PATH;

    # to trigger the rustup download
    cargo --version > /dev/null
  '';
}
