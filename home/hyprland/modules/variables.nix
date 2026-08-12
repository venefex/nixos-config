{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    # Modifiers
    mod = {
      _var = "SUPER";
    };

    # Applications
    terminal = {
      _var = "runapp kitty";
    };

    dropdownTerminal = {
      _var = "kitten quick-access-terminal";
    };

    terminal2 = {
      _var = "runapp foot";
    };

    textEditor = {
      _var = "runapp neovim";
    };

    textEditor2 = {
      _var = "runapp code";
    };

    launcher = {
      _var = "runapp rofi -show drun -show-icons";
    };

    launcherCalc = {
      _var = "runapp rofi -show calc -modi calc -no-show-match -no-sort";
    };

    clipHistory = {
      _var = "runapp cliphist list | rofi -dmenu -i | cliphist decode | wl-copy";
    };

    fileManager = {
      _var = "runapp dolphin";
    };

    browser = {
      _var = "runapp firefox";
    };

    browser2 = {
      _var = "runapp brave";
    };

    passwordManager = {
      _var = "runapp keepassxc";
    };

    musicPlayer = {
      _var = "runapp fooyin";
    };

    videoPlayer = {
      _var = "runapp mpv --player-operation-mode=pseudo-gui";
    };

    messaging = {
      _var = "runapp vesktop";
    };

    calculator = {
      _var = "runapp qalculate-gtk";
    };

    taskManager = {
      _var = "runapp missioncenter";
    };

    volumeControl = {
      _var = "runapp pwvucontrol";
    };

    colorPicker = {
      _var = "runapp hyprpicker --autocopy --format=hex";
    };

  };
}
