{ config, ... }:
{
  imports = [
    ./bash.nix
  ];

  home.sessionVariables = {
    SUDO_EDITOR = "/usr/bin/nvim";
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  home.shellAliases = {
    sedit = "sudoedit";
    switch = "sudo nixos-rebuild switch";
    nixos = "cd /etc/nixos";
  };
}
