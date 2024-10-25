{
  description = "NecroOS - k1's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:Aylur/ags/v2";
    necrovim.url = "github:N4D1K-lgtm/necrovim";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = { nixpkgs, home-manager, necrovim, zen-browser, ... }@inputs:
    let 
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/desktop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              # Specify the system packages
              environment.systemPackages = [
                necrovim.packages.${system}.default
                zen-browser.packages.${system}.default
              ];
            }
          ];
        };
      };

      homeConfigurations."k1" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };
        
        extraSpecialArgs = { inherit inputs; };

       modules = [ ./home/home.nix ];
      };
    };
}

