{ pkgs, ... }: {

  home = {
    packages = with pkgs; [
      lazygit
      bat
      delta

      gh
      opencode
      _1password-cli
    ];
    homeDirectory = "/Users/mendy";
    stateVersion = "26.05";
  };
}
