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

    # Docker - Database Mariadb with Phpmyadmin
    dbStart = "docker compose -f $HOME/github/Calmchy-Database/docker-compose.yml up -d";
    dbStop = "docker compose -f $HOME/github/Calmchy-Database/docker-compose.yml down";
    dbEdit = "codium $HOME/github/Calmchy-Database/";
    dbConnect = "mysql -h 127.0.0.1 -P 3306 -u root"; # open mysql shell
    dbList = "mysql -h 127.0.0.1 -P 3306 -u root -e 'SHOW DATABASES;'"; # list all databases
    dbStatus = "docker ps | grep mariadb"; # check if running
    dbLogs = "docker logs mariadb"; # view mariadb logs
    dbPMA = "brave http://localhost:80"; # open phpmyadmin in browser
    
    # Laravel Sail
    sailhelp="brave file:///home/manatad/Desktop/laravel-sail.html";
    sail = "./vendor/bin/sail";
    sailS = "sail up -d";
    sailD = "sail down";
    npmB = "sail npm run build";
    npmD = "sail npm run dev";

    # Jupyter
    jup = "jupyter notebook";
    jupLab = "jupyter lab";
    jupStop = "jupyter notebook stop";
    jupList = "jupyter notebook list";

    # Ollama
    ollamaStart1 = "ollama run qwen2.5-coder:3b";
    ollamaStop1  = "ollama stop qwen2.5-coder:3b";
    ollamaStart2 = "ollama run qwen2.5-coder:3b-instruct-q8_0";
    ollamaStop2  = "ollama stop qwen2.5-coder:3b-instruct-q8_0";
    ollamaList   = "ollama list";  # show downloaded models
    ollamaPull   = "ollama pull";  # usage: ollamaPull <model>
  };
}