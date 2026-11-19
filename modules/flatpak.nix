{ pkgs, lib, ... }:

let
  # Flatpaks installed system-wide for every user (dev + gaming)
  globalApps = [
    "org.freedownloadmanager.Manager"
  ];
in
{
  services.flatpak.enable = true;

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "flatpak-setup-global" ''
      # Needs root because it installs for all users
      if [ "$(id -u)" -ne 0 ]; then
        exec sudo "$0" "$@"
      fi

      echo "Adding Flathub remote (system)..."
      ${pkgs.flatpak}/bin/flatpak remote-add --system --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

      ${lib.optionalString (globalApps != [ ]) ''
        echo "Installing global Flatpak apps (system)..."
        ${pkgs.flatpak}/bin/flatpak install --system -y --noninteractive flathub ${lib.escapeShellArgs globalApps}
      ''}
      echo "Done! Run 'flatpak list --system' to see global apps."
    '')
  ];
}