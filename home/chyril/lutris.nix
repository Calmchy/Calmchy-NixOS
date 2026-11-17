{ pkgs, ... }:

{
  programs.lutris = {
    enable = true;

    # Proton-GE and Wine runners show up in Lutris automatically
    protonPackages = [ pkgs.proton-ge-bin ];
    winePackages = [ pkgs.wineWow64Packages.stagingFull ];

    # Extra libs/tools available inside Lutris' FHS environment
    extraPackages = with pkgs; [
      mangohud
      winetricks
      gamemode
      gamescope
      umu-launcher
    ];
  };

  home.packages = with pkgs; [
    vulkan-tools
    protonup-qt
  ];
}
