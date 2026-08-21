{ config, pkgs, ... }:

{
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.gtk = {
      enable = true;

      background = "/nix/store/97xdqvza17bp6swl62hh2pw7p6cyrr24-simple-dark-gray-2018-08-28/share/backgrounds/nixos/nix-wallpaper-simple-dark-gray_bottom.png";

      theme.name = "Adwaita";
      iconTheme.name = "Adwaita";
      cursorTheme = {
        name = "Adwaita";
        size = 16;
      };
    };
  };
}