{ config, pkgs, ... }:

{
  imports =
    [
      ./packages.nix
      ./virtualisation.nix
      ./php.nix
    ];

  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "/dev/vda";
  # boot.loader.grub.useOSProber = true;

  boot.loader.systemd-boot.enable = true;

  boot.initrd.kernelModules = [ "amdgpu" ];

  networking.hostName = "nixos";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.bluetooth.enable = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Manila";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fil_PH";
    LC_IDENTIFICATION = "fil_PH";
    LC_MEASUREMENT = "fil_PH";
    LC_MONETARY = "fil_PH";
    LC_NAME = "fil_PH";
    LC_NUMERIC = "fil_PH";
    LC_PAPER = "fil_PH";
    LC_TELEPHONE = "fil_PH";
    LC_TIME = "fil_PH";
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  virtualisation.docker.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    # fade = false;
    # fadeDelta = 4;
    shadow = true;
    shadowOpacity = 0.6;
    settings = {
      corner-radius = 8;

      shadow-exclude = [
        "class_g = 'Plank'"
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
        "window_type = 'menu'"
        "window_type = 'popup_menu'"
        "window_type = 'dropdown_menu'"
      ];

      corner-radius-rules = [
        "0:class_g = 'Plank'"
      ];

      blur-method = "dual_kawase";
      blur-strength = 5;
      # blur-background-frame = false;
      blur-background-fixed = true;

      blur-background-exclude = [
        "class_g = 'Plank'"
        "_GTK_FRAME_EXTENTS@:c"
        "class_g = 'Xfce4-screenshooter'"
        "class_i = 'xfce4-screenshooter'"
      ];

       unredir-if-possible = true;
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.manatad = {
    isNormalUser = true;
    description = "Chyril S. Manatad";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
    packages = with pkgs; [
      thunderbird
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;  # set to false if using SSH keys only
      PermitRootLogin = "no";         # good security practice
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
