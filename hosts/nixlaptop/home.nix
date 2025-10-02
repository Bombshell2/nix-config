{ config, lib, pkgs, ... }:

{
  imports = [
    ../../home/shared.nix
  ];

  home.stateVersion = "25.05";
}

