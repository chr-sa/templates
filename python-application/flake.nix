{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pythonPackages = p: with p; [ numpy ];
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ (pkgs.python310.withPackages pythonPackages) ];
      };
      packages.${system}.default = pkgs.python310Packages.buildPythonPackage rec {
        name = "mypackage";
        nativeBuildInputs = with pkgs.python310Packages; [ setuptools-scm ];
        propagatedBuildInputs = with pkgs.python310Packages; [ numpy ];
        src = ./.;
        format = "pyproject";
        postInstall = ''
          ln -s $out/bin/${name} $out/bin/python3.10-${name}
        '';
      };
    };
}
