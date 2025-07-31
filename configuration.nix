# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/davinci.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages=pkgs.linuxPackages_latest;

  networking.hostName = "bombshell2nix"; # Define your hostname.
  # Pick only one of the below networking options.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.networkmanager.insertNameservers = ["8.8.8.8" "8.8.4.4"];

  # Set your time zone.
  time.timeZone = "America/New_York";

  programs.nix-ld.enable = true;
 
  # Enable Flatpak
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
	      xdg-desktop-portal-wlr
	      xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
  };
  services.flatpak.enable = true;
 
  nixpkgs.config.allowUnfree = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  hardware.steam-hardware.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.adb.enable = true;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bombshell2 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "adbusers" ]; # Enable ‘sudo’ for the user.
  };

  programs.steam.enable = true;
  virtualisation.docker = {
    enable = true;
  };

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    distrobox
    lxqt.lxqt-policykit
    extundelete
    git
  ];

  environment.variables.EDITOR = "nvim";

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    pango
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  security.polkit.enable = true;

  services.greetd = {                                                      
    enable = true;                                                         
    settings = {                                                           
      default_session = {                                                  
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd 'dbus-run-session sway'";
        user = "bombshell2";                                                  
      };                                                                   
    };                                                                     
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

