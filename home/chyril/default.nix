{ ... }:

{
  imports = [
    ./packages.nix
    ./lxqt.nix
    ./flatpak.nix
  ];

  home = {
    username = "chyril";
    homeDirectory = "/home/chyril";
    stateVersion = "26.05";
  };

  # home/chyril/home.nix
  home.shellAliases = {
    update = "cd /home/shared/Calmchy-NixOS && git pull origin dev && sudo nixos-rebuild switch --flake .#nixos";
  };

  programs.home-manager.enable = true;
}
