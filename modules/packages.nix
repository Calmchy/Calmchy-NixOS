{ config, pkgs, ... }:

# System-wide packages shared by every user.
# Per-user packages live in home/<user>/ (home-manager):
#   manatad -> development + XFCE extras
#   chyril  -> gaming + LXQt extras

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "ventoy-gtk3-1.1.17" ];

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      oh-my-posh init fish --config $HOME/.poshthemes/if_tea.omp.json | source
      set -g fish_greeting ""
    '';
  };

  environment.systemPackages = with pkgs; [
    # web
    wget
    curl
    git

    # larp
    fastfetch
    htop
    btop
    nvtopPackages.full
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
    file-roller

    # appimage
    (appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.libxshmfence
      ];
    })

    # hardware / desktop utilities
    lm_sensors
    blueman
    atril

    # text editor
    vim
    micro

    # browser
    librewolf
    brave

    # apps
    clementine
    thunderbird
    obs-studio
    mpv
    vlc
    kitty
    gnome-disk-utility
    baobab
    flatpak
    gnome-software
    telegram-desktop
    # rufin
    # figma-linux

    # misc
    ani-cli
    syncplay
    pciutils
    mesa-demos
    hunspell
    hunspellDicts.en_US
    oh-my-posh
    chafa
    libsecret
    gnome-keyring
    seahorse
  ];
}