{config, lib, pkgs, inputs, ... }:

{
  # Pick only one of the below networking options.
  # Set your time zone.
  time.timeZone = "America/New_York";

  networking.networkmanager = {
    enable = true;  # Easiest to use and most distros use this by default.
    insertNameservers = ["1.1.1.1" "8.8.8.8" "8.8.4.4"];
  };

  programs.nix-ld.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

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

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  users.users.bombshell2 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "adbusers" ]; # Enable ‘sudo’ for the user.
  };
 
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
}
