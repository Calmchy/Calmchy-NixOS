#!/bin/bash

# create user
read -p "Enter your fullname: " fullname
read -p "Enter your username: " username
echo "{ config, pkgs, ... }:

{
  users.users.$username = {
    isNormalUser = true;
    description = "$fullname";
    shell = pkgs.fish; 
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
    packages = with pkgs; [
    thunderbird
    ];
  };
}
" >> hosts/user.nix

# Generate hardware-configuration
nixos-generate-config --root /mnt --show-hardware-config > /mnt/etc/nixos/hosts/hardware-configuration.nix

NIX_CONFIG = "experimental-features = nix=command flakes" nixos-install --flake /mnt/etc/nixos#nixos

echo "Set $username a password!"
nixos-enter --root /mnt -c 'passwd $username'

reboot