{ config, pkgs, ... }:

{
  users.users.manatad = {
    isNormalUser = true;
    description = "Chyril S. Manatad";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
    packages = with pkgs; [
      thunderbird
    ];
  };
}