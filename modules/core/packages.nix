{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Building tools
    gcc
    clang
    rustc
    go
    python3
    cmake
    ninja

    # Archives
    p7zip
    unrar
    unzip
    xz
    zip
    zstd

    # System tools
    ethtool
    evtest
    fd
    ffmpeg
    file
    lm_sensors
    lsof
    ntfs-3g
    pciutils
    stress-ng
    sysstat
    usbutils

    # Text editors
    vim

    # CLI utilities
    btop
    eza
    fastfetch
    hunspellDicts.en-us
    hunspellDicts.it-it
    nixfmt
    tree
    wget
  ];
}
