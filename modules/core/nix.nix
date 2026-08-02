{ ... }:

let
  weekly = {
    automatic = true;
    dates = "weekly";
    randomizedDelaySec = "10min";
    persistent = true;
  };
in
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      auto-optimise-store = true;
      use-xdg-base-directories = true;
    };

    optimise = weekly;

    gc = weekly // {
      options = "--delete-older-than 30d";
    };
  };
}
