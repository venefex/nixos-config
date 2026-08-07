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

    textEditor = {
      _var = "runapp neovim";
    };

    textEditor2 = {
      _var = "runapp code";
    };

    launcher = {
      _var = "runapp rofi -show drun -show-icons";
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

    colorPicker = {
      _var = "runapp hyprpicker --autocopy --format=hex";
    };

    taskManager = {
      _var = "runapp missioncenter";
    };

    volumeControl = {
      _var = "runapp pwvucontrol";
    };
  };
}
