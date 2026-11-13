{ pkgs, ... }:

{
  # XFCE extras for manatad. Panel plugins (whiskermenu, weather, clipman)
  # live system-wide in modules/desktops.nix.
  home.packages = with pkgs; [
    xfce4-panel-profiles
    xfburn
    plank
    bamf

    (thunar.override {
      thunarPlugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
      ];
    })
  ];
}