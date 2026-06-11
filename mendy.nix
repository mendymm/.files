{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    initLua = builtins.readFile ./nvim/init.lua;
  };
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Mendy";
        email = "git@mendy.dev";
      };
      alias = {
        st = "status";
      };
    };
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
