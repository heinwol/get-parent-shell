{ pkgs
, system
, rust-overlay
,
}:
{
  app = pkgs.rustPlatform.buildRustPackage rec {
    pname = "get-parent-shell";
    version = "0.1.0";
    src = ./.;
    cargoBuildFlags = "-p ${pname}";

    cargoLock = {
      lockFile = ./Cargo.lock;
    };

    # nativeBuildInputs = [ pkgs.pkg-config ];
    # PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}
