{ pkgs, lib, ... }:

let
  apps = [
    "org.freedownloadmanager.Manager"
    "org.swi_prolog.swipl"
    "com.getpostman.Postman"
    # "com.usebottles.bottles"
  ];
in
{
  home.packages = [
    (pkgs.writeShellScriptBin "flatpak-setup" ''
      echo "Adding Flathub remote (user)..."
      flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      ${lib.optionalString (apps != [ ]) ''
        echo "Installing Flatpak apps (user)..."
        flatpak install --user -y flathub ${lib.escapeShellArgs apps}
      ''}
      echo "Done! Run 'flatpak list --user' to see installed apps."
    '')
  ];
}