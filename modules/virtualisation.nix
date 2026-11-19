{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu;
      swtpm.enable = true;
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;

  programs.virt-manager.enable = true;
}