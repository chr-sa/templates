{
  description = "chr-sa flake templates";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }@inputs: {
    templates = rec {
      trivial = { path = ./trivial; description = "Simple boilerplate for a flake"; };
      rust = { path = ./rust; description = "Rust template"; };
      python-poetry = { path = ./python-poetry; description = "Python template using poetry"; };
      python-application = { path = ./python-application; description = "Python application template"; };
      torch = { path = ./torch; description = "Python template from nixpkgs with torch"; };
      haskell = { path = ./haskell; description = "Haskell template"; };
      zig = { path = ./zig; description = "Zig template"; };
    };
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
  };
}
