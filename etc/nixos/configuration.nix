#  DDUBS Hyprland, GNOME, BSPWM, Cinnamon config
#

{ config, system, host, options, libs, lib, pkgs, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
            #./configs/pyprland-config.nix
            #./configs/hyprland-config.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos-bspwm"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

services.xserver = {
  enable = true;
  displayManager.lightdm.enable = true;
  desktopManager = {
    cinnamon.enable = true;
    gnome.enable = true;
  };
  windowManager.bspwm.enable = true;
  # Configure keymap in X11
  xkb = {
    layout = "us";
    variant = "";
    };  
  };

  # Use lib.mkForce to prioritize GNOME's gsettings overrides
  environment.sessionVariables.NIX_GSETTINGS_OVERRIDES_DIR = lib.mkForce "${pkgs.gnome-shell}/share/gsettings-schemas/nixos-gsettings-overrides/glib-2.0/schemas";

  programs = { 
      hyprland.enable = true;  
      firefox.enable = true; 
      waybar.enable = true; 
      neovim.enable = true; 
      fuse.userAllowOther = true; 
      dconf.enable = true;
      seahorse.enable = true;
      adb.enable = false;
      thunar.enable = true;
      thunar.plugins = with pkgs.xfce; [
         exo
         thunar-archive-plugin
         thunar-volman
         ];
       mtr.enable = true;
       gnupg.agent = {
           enable = true;
           enableSSHSupport = true;
       };
  };

  #Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    fira-code
    noto-fonts-cjk-sans
    jetbrains-mono
    font-awesome
    terminus_font
    #(nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  services = { 
    openssh.enable = true;
    flatpak.enable = true;
    gnome.gnome-keyring.enable = true; 
    udev.enable = true; 
    gvfs.enable = true;
    envfs.enable = true;
    blueman.enable = false;
    dbus.enable = true; 
    qemuGuest.enable = true;
    pulseaudio.enable = false;
    libinput.enable = false;
    pipewire = {
         enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            #jack.enable = true;
            #media-session.enable = true;
      };
    fstrim = {
       enable = true; 
      interval = "weekly"; 
       }; 
    smartd = {
       enable = false;
       autodetect = true;
        };
     rpcbind.enable = true;
     nfs.server.enable = true;
     printing = {
      enable = true;
      drivers = [
        # pkgs.hplipWithPlugin
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    ipp-usb.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dwilliams = {
    isNormalUser = true;
    description = "Don Williams";
    extraGroups = [ 
       "networkmanager" 
       "wheel" 
       "libvirtd"
       "docker"
       "input"
     ];
    packages = with pkgs; [
       #thunderbird
    ];
  };

systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      flatpak install -y flathub com.github.tchx84.Flatseal
      flatpak install -y flathub com.github.flattool.Warehouse
    '';
  };

  # ENV sessionVariables
 environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
#
  # Disable Passord for wheel group
  security.sudo.wheelNeedsPassword = false; 
  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        subject.isInGroup("users")
          && (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          )
        )
      {
        return polkit.Result.YES;
      }
    })
  '';

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
   ## Gnome ## 
     gnomeExtensions.blur-my-shell
     gnomeExtensions.burn-my-windows
     gnomeExtensions.pop-shell
     gnomeExtensions.caffeine
     gnomeExtensions.clipboard-indicator
     gnomeExtensions.vitals
     gnomeExtensions.just-perfection
     gnomeExtensions.open-bar
     gnomeExtensions.workspace-indicator
     gnomeExtensions.system-monitor
     gnome-extension-manager
   ## End ##
   #
   arandr
   appimage-run
   bat
   btop
   bottom
   cargo
   cava
   clang
   cmatrix
   curl
        #discord
   discord-canary
   dua
   duf
   dunst
   eza 
   emacs-nox
   fastfetch
   feh
   fd
   findutils
   file-roller
   ffmpeg
   fortune
   flameshot
   fd
   fzf
   gcc
   git
   glances
   glibc
   ghostty
   glib
   glxinfo
   gpu-viewer
   gnumake
   google-chrome
   gping
   htop
   hyfetch
   imagemagick
   iotop
   inxi
   jq
   kitty
   killall
   lazygit
        #libvirt
   libnotify
   lshw
   lsd
   lxqt.lxqt-policykit
   luarocks
   lunarvim
   lxappearance
   mission-center
   meson
   mc
   mpd
   mpv
   mlocate
   multimarkdown
   neofetch
   neovide
   ncftp
   nodejs
   nh
   ncdu
   ninja
   nwg-look
   nodejs
   #nvtopPackages.full
   oh-my-posh
   oh-my-zsh
   pavucontrol
   pciutils
   pkg-config
   picom
   ptyxis
   polybar
   pyprland
   ranger
   ripgrep
   rofi-wayland
   nitrogen
   shellcheck
   starship
   swww
   sxhkd
   tmux    
   ugrep
   unzip
   usbutils
   variety
   virt-viewer
   vlc
   vscode-fhs
   volumeicon
   waypaper
   wezterm
   wget 
   wofi
  #  override for Yazi to keep it at v3.3
  #  (yazi.overrideAttrs (oldAttrs: {
        #   inherit (oldAttrs) pname;
        #      version = "0.3.3";
        #    }))
   yazi
   ytmdl
   zip
   zsh
   zig
   zoxide
 ];

   xdg.portal = {
    enable = true;
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
   };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
   networking.firewall.enable = false;

  system.stateVersion = "24.05"; 

}
