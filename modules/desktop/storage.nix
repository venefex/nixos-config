{ ... }:

{
  # Provides a D-Bus service for managing storage devices
  services.udisks2.enable = true;

  # Provides GNOME Virtual File System support
  services.gvfs.enable = true;
}
