{
  pkgs,
  self,
  lib,
  ...
}:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # system utils
    neovim
    nil
    nixd
    delta
    git
    curl
    just

    # search tools
    dust
    fzf
    tokei
    ripgrep

    # compression
    zstd
    xz
    lz4

    # monitoring
    bmon
    btop
    htop

    # fs tools
    rclone

    # programing
    typst
    go
    python3
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = true;

  users.knownUsers = [ "mendy" ];

  users.users.mendy = {
    shell = pkgs.fish;
    uid = 501;
    home = "/Users/mendy";
  };

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "1password-cli"
    ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
