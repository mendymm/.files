{ pkgs, ... }: {

  home = {
    packages = with pkgs; [
      lazygit
      bat
      delta

      gh
      opencode
      _1password-cli

      cargo-deny
      cargo-sort
    ];
    homeDirectory = "/Users/mendy";
    stateVersion = "26.05";
  };
}
