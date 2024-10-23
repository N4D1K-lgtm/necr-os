{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:Aylur/ags";
    necrovim.url = "github:N4D1K-lgtm/necrovim";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = inputs@{ nixpkgs, home-manager, necrovim, zen-browser, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/desktop/configuration.nix

	  home-manager.nixosModules.home-manager
          {
            environment.systemPackages = [
              necrovim.packages.x86_64-linux.default
              zen-browser.packages.x86_64-linux.default
            ];

	          home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.k1 = import ./home/home.nix;
            
          }        
	];
      };
    };
  };
}
