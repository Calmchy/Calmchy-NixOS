#!/usr/bin/env bash
set -euo pipefail

# create user
read -p "Enter your fullname: " fullname
read -p "Enter your username: " username

cat > hosts/user.nix << EOF
{ config, pkgs, ... }:

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
EOF

# Generate hardware-configuration
nixos-generate-config --root /mnt --show-hardware-config > /mnt/etc/nixos/hosts/hardware-configuration.nix

# Install
export NIX_CONFIG="experimental-features = nix-command flakes"
nixos-install --flake /mnt/etc/nixos#nixos

echo "Set $username a password!"
nixos-enter --root /mnt -c "passwd $username"

reboot
