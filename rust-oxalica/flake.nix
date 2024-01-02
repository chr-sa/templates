{
  description = "A devShell example";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, rust-overlay, ... }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs ["x86_64-linux" "aarch64-darwin"]
          (system: function nixpkgs.legacyPackages.${system});
      overlays = [ (import rust-overlay) ];
      pkgs = import nixpkgs {
        inherit system overlays;
      };
    in
      with pkgs;
      {
        devShells = forAllSystems (pkgs: {
          default = mkShell {
            buildInputs = [
              openssl
              pkg-config
              rust-bin.beta.latest.default
            ];
          };
        });
      }
}
