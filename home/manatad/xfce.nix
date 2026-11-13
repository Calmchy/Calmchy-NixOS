{ pkgs, ... }:

{
  # XFCE extras for manatad. Panel plugins (whiskermenu, weather, clipman)
  # live system-wide in modules/desktops.nix.
  home.packages = with pkgs; [
    xfce4-panel-profiles
    xfburn
    plank
    bamf
  ];
}