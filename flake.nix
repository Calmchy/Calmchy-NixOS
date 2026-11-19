{
  description = "NixOS config for calmchy";

  inputs = {
    nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "git+https://github.com/nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Don't add nixpkgs.follows here: it breaks cache hits
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  outputs = { self, nixpkgs, home-manager, nix-cachyos-kernel, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/configuration.nix
        ./hosts/hardware-configuration.nix

        # CachyOS kernel overlay: pinned nixpkgs so the binary cache matches
        ({ pkgs, ... }: {
          nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
          boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore;
        })

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "bak";

            users = {
              manatad = import ./home/manatad;  # developer, XFCE
              chyril = import ./home/chyril;    # gamer, LXQt
            };
          };
        }
      ];
    };
  };
}