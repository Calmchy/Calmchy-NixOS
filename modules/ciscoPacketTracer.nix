{ pkgs, ... }:

let
  pt-appimage-run = pkgs.appimage-run.override {
    extraPkgs = p: with p; [
      libpng
      icu
      libxkbcommon
      (p.libxkbfile or p.xorg.libxkbfile)
      nss
      nspr
      alsa-lib
      krb5
      libpulseaudio
      fontconfig
      freetype
      zlib
      dbus
      openssl
      libglvnd
    ];
  };
in
{
  programs.appimage.package = pt-appimage-run;

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "pt" ''
      exec ${pt-appimage-run}/bin/appimage-run \
        "$HOME/Apps/CiscoPacketTracer/packettracer.AppImage" "$@"
    '')
  ];
}