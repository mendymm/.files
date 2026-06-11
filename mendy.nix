{pkgs, ...}: {
  programs.neovim = import ./nvim/nvim.nix {pkgs = pkgs;};
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
