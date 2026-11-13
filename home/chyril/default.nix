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

  programs.home-manager.enable = true;
}
