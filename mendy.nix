{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    initLua = builtins.readFile ./nvim/init.lua;
  };
  home = {
    packages = with pkgs; [
      (import ./fmt_dots.nix {inherit pkgs;})
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
