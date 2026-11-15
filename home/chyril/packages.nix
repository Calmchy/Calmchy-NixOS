{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.kate
    # Optional: includes ktexteditor components for root/sudo saving support
    kdePackages.ktexteditor
    kdePackages.konsole
    kdePackages.bluedevil

    gamescope

    cemu
    azahar
    melonds
    mgba
    dolphin-emu
    ppsspp-sdl
    pcsx2
    eden
  ];
}
