{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # web
    wget
    curl
    git

    # larp
    fastfetch
    htop
    btop
    cmatrix
    cava
    nyancat
    tty-clock

    # files
    zip
    unzip
    p7zip
    gparted
    xarchiver

    # XFCE
    xfce4-whiskermenu-plugin
    xfce4-panel-profiles
    xfce4-weather-plugin
    lm_sensors
    blueman
    plank

    # text editor
    vim
    micro
    vscode

    # browser
    brave
    firefox-esr

    # compilers / interpreter
    jdk8
    clang
    python3
    
    # container / virtual machine
    docker-compose
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    virtio-win   
    win-spice

    # software apps
    clementine
    obs-studio
    handbrake
    tigervnc
    veracrypt
    mpv

    # unknown
    ani-cli
    syncplay
    pciutils
    mesa-demos
  ];
}