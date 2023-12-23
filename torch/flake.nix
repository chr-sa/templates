{
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { nixpkgs, ... }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-darwin" ] (system:
          function (import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          }));
      pythonPackages = p:
        with p; [
          pip
          torch-bin
          (pytorch-lightning.override { torch = torch-bin; })
          numpy
          mlflow
        ];
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [ (pkgs.python3.withPackages pythonPackages) ];
        };
      });
    };
}
