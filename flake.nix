{
  description = "Homelab";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sane-test-pkg = {
      url = "path:./packages/sane-test";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, sane-test-pkg, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (self: super: {
            sane-test = sane-test-pkg.packages.${system}.default;
          })
        ];
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      # Please replace my-nixos with your hostname
      nixosConfigurations.titan = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./hosts/titan


          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.m = import ./home.nix;
          }
        ];
        specialArgs = {
          inherit pkgs;
        };
      };
    };
}
