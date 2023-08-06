{
  description = "chr-sa flake templates";

  outputs = { self }: {
    templates = rec {
      rust = { path = ./rust; description = "Rust Template"; };
      python-poetry = { path = ./python-poetry; description = "Python Template using Poetry"; };
      haskell = { path = ./haskell; description = "Haskell Template"; };
    };
  };
}
