#!/usr/bin/env bash
set -euo pipefail
cd /home/shared/Calmchy-NixOS
export NIX_CONFIG="experimental-features = nix-command flakes"

CACHE="https://cache.lantian.pub/lantian"
KEY="lantian:WVGO7vsRMSEN+h7Lp7kv6SAmrkEXgUGbbXm7jMDjBuQ="

K=$(nix eval --raw .#nixosConfigurations.nixos.config.boot.kernelPackages.kernel.outPath)
echo "Kernel: $K"

if ! nix path-info --store "$CACHE" "$K" >/dev/null 2>&1; then
  echo "NOT in cache, so a rebuild would compile it. Stopping."
  echo "Try: nix flake update nix-cachyos-kernel   then run this again."
  exit 1
fi

echo "Cache has it, rebuilding."
sudo nixos-rebuild switch --flake .#nixos \
  --option extra-substituters "$CACHE" \
  --option extra-trusted-public-keys "$KEY"