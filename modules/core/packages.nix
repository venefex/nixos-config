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
    age
    ethtool
    evtest
    fd
    ffmpeg
    file
    lm_sensors
    lsof
    ntfs3g
    pciutils
    sops
    stress-ng
    sysstat
    usbutils

    # Text editors
    vim

    # CLI utilities
    htop
    eza
    fastfetch
    hunspellDicts.en-us
    hunspellDicts.it-it
    nixfmt
    tree
    wget
  ];
}
