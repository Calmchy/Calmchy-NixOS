{ ... }:

{
  imports = [
    ./gaming.nix
    ./lxqt.nix
  ];

  home = {
    username = "chyril";
    homeDirectory = "/home/chyril";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}