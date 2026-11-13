{ pkgs, ... }:

# LXQt extras for chyril.
# LXQt itself (panel, session, config, pcmanfm-qt, qterminal, pavucontrol-qt,
# lximage-qt, lxqt-archiver, screengrab, qps, notifications, polkit, power
# management, breeze icons) is installed by services.xserver.desktopManager.lxqt
# in modules/desktops.nix. This file only adds what that module does not ship.

{
  home.packages = with pkgs; [
    networkmanagerapplet   # network tray icon (nm-applet), autostarted below
    featherpad             # lightweight Qt text editor
    # copyq                # clipboard manager (LXQt has none); uncomment if wanted
    # papirus-icon-theme   # alternative icon theme to the default breeze-icons
  ];

  # Start the network applet with the LXQt session.
  xdg.configFile."autostart/nm-applet.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Network
    Exec=${pkgs.networkmanagerapplet}/bin/nm-applet
    X-LXQt-Need-Tray=true
  '';

  xdg.configFile."autostart/bluedevil.desktop".text = "
  [Desktop Entry]
  Type=Application
  Name=Bluedevil
  Exec=bluedevil-monolithic
  Hidden=false
  ";

  # Create ~/Desktop, ~/Documents, ~/Downloads, ~/Music, ~/Pictures, ~/Videos...
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
