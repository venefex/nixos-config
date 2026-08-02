{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "venefex";
      user.email = "git@alexdidom.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
