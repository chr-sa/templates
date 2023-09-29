{
  description = "chr-sa flake templates";

  outputs = { self }: {
    templates = rec {
      rust = { path = ./rust; description = "Rust template"; };
      python-poetry = { path = ./python-poetry; description = "Python template using poetry"; };
      python-application = { path = ./python-application; description = "Python application template"; };
      torch = { path = ./torch; description = "Python template from nixpkgs with torch"; };
      haskell = { path = ./haskell; description = "Haskell template"; };
    };
  };
}
