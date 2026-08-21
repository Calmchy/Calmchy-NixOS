{ config, pkgs, ... }:

let
  extraExtensionNames = [
    "pdo_mysql"
    "pdo_pgsql"
    "pdo_sqlite"
    "gd"
    "zip"
    "redis"
    "intl"
    "sodium"
    "bcmath"
  ];

  php = pkgs.php85.withExtensions (exts:
    let
      alreadyEnabled = map (e: e.extensionName) exts.enabled;
      namesToAdd = builtins.filter (n: !(builtins.elem n alreadyEnabled)) extraExtensionNames;
      extra = map (n: exts.all.${n}) namesToAdd;
    in
    exts.enabled ++ extra
  );
in
{
  environment.systemPackages = with pkgs; [
    php
    php.packages.composer
    laravel
    nodejs_22
  ];
}