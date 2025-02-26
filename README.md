# Stand Alone NIXOS 

## Configure NIXOS, Hyprland, BSPWM, GNOME and Cinnamon using configuration.nix 

The goal is to learn how to use just /etc/nixos/configuration.nix to accomplish this. 

Without flakes or home manager. 

It's not meant to be anything other than a learning tool for myself but my plan is to use
this on a guest PC at my house.  One that I will have to do very little maintenance on.
If corrupted or hardware failure the recovery time will be minimal. 


### Date: Feb 25, 2025  
### Version: 0.1

### Status: 
 Basic configuration for the OS and all needed packages done.
 LightDM with Slick greeter is current Login Manager

 BSPWM uses the existing config from Drew  @JustAguyLinux 
 HyprLand currently is my own config.  VERY bare. It should be able to support other dotfiles
 GNOME  Very basic, some common extensions are preloaded 
 Cinnamon Very basic  Using default config at moment. Need to research adding plugins/widgets by default 

### Layout:  
    etc/nixos          Top level 
    etc/nixos/configs  The config files for HL, BSPWM, etc
    etc/nixos/scripts  Any scripts need for install or post install 
    etc/nixos/assets   Any files needed to support configuration or scripting






 ### Credits/Acknowlegements:  
  Tyler Kelley   @zaney   For helping me on this NIX journey  I would not have gotten this far on my own.
  Drew           @JustAGuyLinux For re-introducing me to BSPWM and reminding me how good Debian is 
  JAK            @Jakoolit  His amazing work with Hyprland and install scripting 
  Stephan Raaba  @ML4W  Since very early in Hyprland development his configuration has inspired me and made using everyday Hyprland possible


