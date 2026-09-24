{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # web
    wget curl git

    # larp
    fastfetch htop btop cmatrix cava nyancat tty-clock

    # files
    zip unzip p7zip gparted xarchiver file-roller

    # appimage
    appimage-run

    # XFCE extras
    xfce4-whiskermenu-plugin
    xfce4-panel-profiles
    xfce4-weather-plugin
    lm_sensors
    blueman
    plank

    # text editor
    vim micro

    # IDE
    godot_4
    vscodium
    netbeans

    # browser
    brave

    # compilers / interpreters
    jdk8 jdk25 clang python3

    # Client
    mariadb.client

    # container / virt
    docker-compose
    virt-manager virt-viewer
    spice spice-gtk spice-protocol
    virtio-win win-spice

    # apps
    clementine obs-studio handbrake
    tigervnc veracrypt mpv alacritty libreoffice

    # misc
    ani-cli syncplay pciutils mesa-demos
    hunspell hunspellDicts.en_US
    oh-my-posh chafa
  ];
}