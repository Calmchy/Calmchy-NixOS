{ ... }:

{
  # Shared group + directory for things both users work on (e.g. the NixOS config repo).
  users.groups.shared = { };
  users.users.manatad.extraGroups = [ "shared" ];
  users.users.chyril.extraGroups = [ "shared" ];

  # setgid (2) so everything created inside keeps the "shared" group.
  systemd.tmpfiles.rules = [
    "d /home/shared 2775 root shared -"
  ];

  # Git for every user (/etc/gitconfig). Identity (user.name / user.email) stays per user.
  programs.git = {
    enable = true;
    config = {
      # the shared repo is owned by one user but used by both
      safe.directory = "/home/shared/Calmchy-NixOS";
    };
  };
}