{ config, pkgs, ... }:

# System-wide packages shared by every user.
# Per-user packages live in home/<user>/ (home-manager):
#   manatad -> development + XFCE extras
#   chyril  -> gaming + LXQt extras

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "ventoy-gtk3-1.1.17" ];

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      oh-my-posh init fish --config $HOME/.poshthemes/if_tea.omp.json | source
      set -g fish_greeting ""
      
      # Load ~/.env file
      if test -f ~/github/Calmchy-NixOS/.env
        for line in (grep -v '^#' ~/github/Calmchy-NixOS/.env | grep -v '^$')
          set -l key (string split -m1 '=' $line)[1]
          set -l val (string split -m1 '=' $line)[2]
          set -gx $key $val
        end
      end
    '';
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
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
    geany

    # browser
    librewolf
    brave

    # Client
    tailscale

    # apps
    clementine
    thunderbird
    obs-studio
    handbrake
    veracrypt
    mpv
    vlc
    kitty
    libreoffice
    kdePackages.kdenlive
    gnome-disk-utility
    baobab
    gajim
    gimp
    flatpak
    gnome-software
    telegram-desktop
    # rufin
    # figma-linux
    ventoy-full-gtk

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