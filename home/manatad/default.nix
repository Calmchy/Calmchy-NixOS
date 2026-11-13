{ pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./php.nix
    ./ciscoPacketTracer.nix
    ./xfce.nix
    ./flatpak.nix
  ];

  home = {
    username = "manatad";
    homeDirectory = "/home/manatad";
    stateVersion = "26.05";

    sessionVariables = {
      ANDROID_HOME = "/home/manatad/Android/Sdk";
      ANDROID_SDK_ROOT = "/home/manatad/Android/Sdk";
      CHROME_EXECUTABLE = "${pkgs.brave}/bin/librewolf";  # carried over unchanged from hosts/configuration.nix
    };
  };

  programs.home-manager.enable = true;
}