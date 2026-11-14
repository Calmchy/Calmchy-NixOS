{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../modules/packages.nix
      ../modules/virtualisation.nix
      ../modules/desktops.nix
      ../modules/shared.nix
      ../modules/picom.nix
      ../modules/aliases.nix
      ../modules/kitty.nix
      ../modules/flatpak.nix
      ../modules/usbguard.nix
      ../modules/ciscoPacketTracer.nix
    ];

  # UEFI (physical machine) — uncomment this block:
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # BIOS/Legacy (VMs, older hardware) — uncomment this block:
  # boot.loader.grub = {
  #   enable      = true;
  #   device      = "/dev/vda";  # VM disk — check with: lsblk
  #   efiSupport  = false;
  #   useOSProber = true;
  # };

  # systemd-boot (UEFI only, simpler/faster) — uncomment this block:
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = [ "amdgpu" ];
  # boot.kernelModules = [ "hid-nintendo" "joydev" ];


  networking.hostName = "nixos";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.bluetooth.enable = true;
  hardware.uinput.enable = true;

  services.udev.packages = [ pkgs.game-devices-udev-rules ];

  networking.networkmanager.enable = true;

  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

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
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # X11, LightDM, XFCE (manatad) and LXQt (chyril) are set up in modules/desktops.nix
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  services.udisks2.mountOnMedia = true;
  services.gvfs.enable = true;
  programs.xfconf.enable = true;

  programs.fish.enable = true;

  programs.dconf.enable = true;

  services.dbus.enable = true;

  services.tailscale.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.lightdm.enableGnomeKeyring = true;

  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.ollama = {
    enable = true;
    # acceleration = "rocm";  # AMD GPU — change to "cuda" if nvidia
  };

  # ANDROID_HOME / ANDROID_SDK_ROOT / CHROME_EXECUTABLE moved to home/manatad/default.nix

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

  # Packages for each user are managed by home-manager (see flake.nix and home/).

  # Developer — XFCE
  users.users.manatad = {
    isNormalUser = true;
    description = "Dev";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "docker" "libvirtd" "adb" ];
  };

  # Gamer — LXQt (set a password after the first rebuild: sudo passwd chyril)
  users.users.chyril = {
    isNormalUser = true;
    description = "Gaming";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "shared" ];
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
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
    extraConfig = ''
      Subsystem sftp internal-sftp
      AllowTcpForwarding yes
    '';
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [
      config.services.tailscale.port
      5353
    ];

    allowedTCPPorts = [
      57891
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
