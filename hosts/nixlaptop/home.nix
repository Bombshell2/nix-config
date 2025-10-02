{ config, lib, pkgs, ... }:

{
  imports = [
    ../../home/shared.nix
  ];
  home.packages = with pkgs; [];

  home.stateVersion = "25.05";
}

