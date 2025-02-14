{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
, stdenv
, darwin
}:

rustPlatform.buildRustPackage {
  pname = "cargo-component";
  version = "unstable-2023-08-24";

  src = fetchFromGitHub {
    owner = "bytecodealliance";
    repo = "cargo-component";
    rev = "a4ee64625a5248234397a9c7c2a7513bb025b030";
    hash = "sha256-7fnzIzWb2f1tJfH3mLMesQtNCy4Zg7I/T+lGiorifY8=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "warg-api-0.1.0" = "sha256-A5FQ/nbuzV8ockV6vOMKUEoJKeaId3oyZU1QeNpd1Zc=";
      "wit-bindgen-0.10.0" = "sha256-/QZIIbUzDFUb5wAGoKFg1BbgNUEmP06ZJKVzhwlPecE=";
    };
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  # requires the wasm32-wasi target
  doCheck = false;

  meta = with lib; {
    description = "A Cargo subcommand for creating WebAssembly components based on the component model proposal";
    homepage = "https://github.com/bytecodealliance/cargo-component";
    license = licenses.asl20;
    maintainers = with maintainers; [ figsoda ];
  };
}
