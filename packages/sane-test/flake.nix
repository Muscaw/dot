{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pname = "sane-backend-test";
        version = "1.0.0";
        #sane-backends = nixpkgs.legacyPackages.${system}.sane-backends.sane-backends;
        pkgs = nixpkgs.legacyPackages.${system};
        #maintainers = with pkgs.lib.maintainers; [muscaw];
        inherit (pkgs) stdenv;
      in
      {
        packages.default = stdenv.mkDerivation {
          inherit system pname version;

          dontUnpack = true;

          installPhase = ''
              mkdir -p $out/etc/sane.d/dll.d
              echo "test" > $out/etc/sane.d/dll.d/test.conf
          '';
        };
      }
    );
}
