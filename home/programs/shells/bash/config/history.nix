{ ... }:

{
  programs.bash = {
    historyControl = [ "ignoreboth" ];
    historySize = 1000000;
    historyFileSize = 1000000;

    shellOptions = [
      "histappend" # Append to the history file, don't overwrite it
      "cmdhist" # Multi-line command history
    ];
  };
}
