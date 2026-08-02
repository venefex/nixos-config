{ ... }:

# Windows-formatted storage drives
let
  ntfsOptions = [
    "rw"
    "uid=1000"
    "gid=100"
    "umask=022"
    "nofail"
    "windows_names"
  ];
in
{
  fileSystems = {
    "/data/storage1" = {
      device = "/dev/disk/by-uuid/9A0C27240C26FAC1";
      fsType = "ntfs3";
      options = ntfsOptions;
    };

    "/data/storage2" = {
      device = "/dev/disk/by-uuid/0AC2486DC2485F57";
      fsType = "ntfs3";
      options = ntfsOptions;
    };

    "/data/music" = {
      device = "/dev/disk/by-uuid/929C67529C672FC1";
      fsType = "ntfs3";
      options = ntfsOptions;
    };
  };
}
