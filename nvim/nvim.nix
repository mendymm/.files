{pkgs, ...}: {
  initLua = builtins.readFile ./init.lua;
  enable = true;
  plugins = [
    (
      pkgs.vimUtils.buildVimPlugin
      {
        pname = "precognition.nvim";
        version = "1.3.0";
        src = pkgs.fetchFromGitHub {
          owner = "tris203";
          repo = "precognition.nvim";
          tag = "v1.3.0";
          hash = "sha256-EIc/Z7ifZk7L+X6/VrqckyZnvhOSdtVcQG8uJzAycXg=";
        };
      }
    )

    (
      pkgs.vimUtils.buildVimPlugin {
        pname = "hardtime.nvim";
        version = "1.2.0";
        src = pkgs.fetchFromGitHub {
          owner = "m4xshen";
          repo = "hardtime.nvim";
          tag = "v1.2.0";
          hash = "sha256-Jy9ARUHU1ySpSxxoS3hLRjxp5Lqt7juWN5Jnbdo0rg0=";
        };
      }
    )
  ];
}
