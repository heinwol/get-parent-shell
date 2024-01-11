{
  description = "A flake for building a Rust workspace using buildRustPackage.";

  inputs = {
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.follows = "rust-overlay/flake-utils";
    nixpkgs.url = "nixpkgs";
  };

  outputs = inputs: with inputs;
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        code = pkgs.callPackage ./. { inherit pkgs system rust-overlay; };
      in
      rec {
        packages = rec {
          app = code.app;
          # wasm = code.wasm;
          # all = pkgs.symlinkJoin {
          #   name = "all";
          #   paths = with code; [ app wasm ];
          # };
          default = app;
        };
      }
    );
}
