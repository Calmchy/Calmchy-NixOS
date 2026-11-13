{ pkgs, ... }:

# System side of Cisco Packet Tracer: appimage-run with the extra libs it needs.
# The `pt` launcher itself is installed for manatad in home/manatad/ciscoPacketTracer.nix

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
}