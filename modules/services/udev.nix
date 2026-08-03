{ ... }:

{
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", ATTRS{idVendor}=="9d5b", ATTRS{idProduct}=="240c", MODE="0660", GROUP="users", TAG+="uaccess"
  '';
}
