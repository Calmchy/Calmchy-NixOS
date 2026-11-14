{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  # Both desktops are installed; each user gets their own default session.
  services.xserver.desktopManager.xfce.enable = true;   # manatad
  services.xserver.desktopManager.lxqt.enable = true;   # chyril

  # XFCE panel plugins are kept system-wide so xfce4-panel can discover them.
  environment.systemPackages = with pkgs; [
    xfce4-whiskermenu-plugin
    xfce4-weather-plugin
    xfce4-clipman-plugin
  ];

  # Default LightDM session per user (AccountsService). Users can still pick
  # another session from the greeter; this only resets on boot.
  systemd.tmpfiles.settings."10-default-sessions" = {
    "/var/lib/AccountsService/users/manatad"."f+" = {
      mode = "0600";
      user = "root";
      group = "root";
      argument = "[User]\nSession=xfce\nXSession=xfce\n";
    };
    "/var/lib/AccountsService/users/chyril"."f+" = {
      mode = "0600";
      user = "root";
      group = "root";
      argument = "[User]\nSession=lxqt\nXSession=lxqt\n";
    };
  };
}