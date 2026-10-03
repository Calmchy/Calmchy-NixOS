{ pkgs, ... }:

{
  services.flatpak.enable = true;

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "flatpak-setup" ''
      echo "Adding Flathub remote..."
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

      echo "Installing Flatpak apps..."
      flatpak install -y flathub \
        org.freedownloadmanager.Manager

      echo "Done! Run 'flatpak list' to see installed apps."
    '')
  ];
}