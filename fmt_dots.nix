{pkgs, ...}: (
  pkgs.writeShellApplication {
    name = "fmt-dots";
    runtimeInputs = with pkgs; [alejandra stylua];
    text = ''
      alejandra "$@"
      stylua "$@"
    '';
  }
)
