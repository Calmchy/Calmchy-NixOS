#!/usr/bin/env bash
set -euo pipefail

# Install
export NIX_CONFIG="experimental-features = nix-command flakes"
sudo nixos-rebuild switch --flake .

echo "You may now reboot"