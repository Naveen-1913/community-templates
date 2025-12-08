{ pkgs, template ? "js", ts ? false, ... }: {
  packages = [
    pkgs.nodejs_20
  ];

  bootstrap = ''
    mkdir -p "$out/.idx/"
    cp -rf ${./dev.nix} "$out/.idx/dev.nix"
    cp -r ${./dev}/* "$out"

    # Install NativeScript CLI globally so Firebase Studio can find it
    npm install -g nativescript

    # Create a sample NativeScript app in the workspace root
    npx ns create example --${template} ${if ts then "--ts" else ""} --path "$out"

    chmod -R +w "$out"
    cd "$out/example"
    npm install
  '';
}
