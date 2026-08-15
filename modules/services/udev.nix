{ ... }:

{
  services.udev.extraRules = ''
    # Keyboard: KBDFans Onigi
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", ATTRS{idVendor}=="9d5b", ATTRS{idProduct}=="240c", MODE="0660", GROUP="users", TAG+="uaccess"

    # AIO: NZXT Kraken 2024 Elite RGB
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="3012", TAG+="uaccess"
  '';
}
