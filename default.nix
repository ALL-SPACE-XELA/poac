{ pkgs ? import <unstable> {} }:

pkgs.mkShell.override { stdenv=pkgs.llvmPackages_17.stdenv; } ({
  name = "poac clang environment";

  nativeBuildInputs = with pkgs; [
      clang_17
      bear
      pkg-config
      fmt
      tbb_2021_11
      libgit2
      libcpr
      nlohmann_json
      openssl
  ];

  IS_NIX_SHELL = 1;
  NIX_CXX_PATH="${pkgs.clang_17}/bin";

  shellHook = ''
    export NIX_CLANGD_PATH=`which clangd`
    export CXX=`which clang++`
    export CC=`which clang`
    '';
})

