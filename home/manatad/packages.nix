{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # IDE / editors
    godot_4
    vscodium
    netbeans
    android-studio

    # android
    android-tools

    # compilers / interpreters
    jdk25
    (lib.lowPrio jdk8)   # lowPrio: jdk25 wins the shared files (java, javac, keytool...)
    clang
    dart

    # framework
    flutter

    # Python and Jupyter Notebook
    (python3.withPackages (ps: with ps; [
      jupyter
      notebook
      numpy
      pandas
      matplotlib
    ]))

    # database
    mariadb.client
    dbeaver-bin

    # container / virt
    # (virt-manager itself comes from programs.virt-manager in modules/virtualisation.nix)
    docker-compose
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    virtio-win
    win-spice

    # diagrams
    dia
    drawio

    # remote access
    rustdesk
    tigervnc
  ];
}