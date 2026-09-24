{ config, pkgs, ... }:

{
  environment.shellAliases = {
    # NixOS aliases
    nixEdit = "codium ~/github/Calmchy-NixOS"; # Edit NixOS Configuration
    nixUpdate = "sudo nixos-rebuild switch --flake ~/github/Calmchy-NixOS#nixos"; # NixOS Update/Upgrade
    nixClean = "sudo nix-collect-garbage -d"; # Delete all NixOS gen accept the latest build/gen
    nixClean7D = "sudo nix-collect-garbage --delete-older-than 7d"; # Delete 7 days old NixOS build/gen

    # Terminal aliases
    cls = "cls";

    # Docker
    dbStart = "docker compose -f $HOME/github/Calmchy-Database/docker-compose.yml up -d";
    dbStop = "docker compose -f $HOME/github/Calmchy-Database/docker-compose.yml down";
    dbEdit = "codium $HOME/github/Calmchy-Database/";


    # Laravel



    # Laravel Sail
    sailhelp="brave file:///home/manatad/Desktop/laravel-sail.html";
    sail = "./vendor/bin/sail";
    sailS = "sail up -d";
    sailD = "sail down";
    npmB = "sail npm run build";
    npmD = "sail npm run dev";
  };
}