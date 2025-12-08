{ pkgs, ... }: {
  channel = "stable-23.11";

  packages = [
    pkgs.nodejs_20
    pkgs.jdk17
  ];

  env = { };

  idx = {
    extensions = [
      "nrwl.angular-console"
      "esbenp.prettier-vscode"
      "firsttris.vscode-jest-runner"
    ];

    workspace = {
      onCreate = {
        install = ''
          npm install
        '';
        default.openFiles = [ "app/app.js" ];
      };
      # Optional: add onStart hook if needed
    };

    # Previews can be enabled later if Firebase Studio supports it
    # previews = {
    #   enable = true;
    #   previews = {
    #     web = {
    #       command = [ "ns" "preview" "--" "--port" "$PORT" "--hostname" "0.0.0.0" ];
    #       manager = "web";
    #     };
    #   };
    # };
  };
}
