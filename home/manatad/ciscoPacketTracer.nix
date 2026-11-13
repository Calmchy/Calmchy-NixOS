{ pkgs, osConfig, ... }:

{
  # `pt` launcher; uses the appimage-run (with extra libs) defined system-wide
  # in modules/ciscoPacketTracer.nix. Setup notes: modules/ciscoNote.txt
  home.packages = [
    (pkgs.writeShellScriptBin "pt" ''
      exec ${osConfig.programs.appimage.package}/bin/appimage-run \
        "$HOME/Apps/CiscoPacketTracer/packettracer.AppImage" "$@"
    '')
  ];
}