{ pkgs, ... }: {

  home = {
    packages = with pkgs; [
      lazygit
    ];
    homeDirectory = "/Users/mendy";
    stateVersion = "26.05";
  };
}
