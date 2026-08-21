{ config, pkgs, ... }:

let
  php = pkgs.php85.withExtensions (exts: with exts.enabled; [
    pdo
    pdo_mysql
    pdo_sqlite
    pdo_pgsql
    mbstring
    openssl
    tokenizer
    xml
    ctype
    json
    bcmath
    curl
    fileinfo
    gd
    zip
    redis
    intl
    sodium
  ]);
in
{
  environment.systemPackages = with pkgs; [
    php
    php.packages.composer
    laravel     # provides the `laravel` CLI -> `laravel new myproject`
    nodejs_20   # for Vite / npm asset builds
  ];
}