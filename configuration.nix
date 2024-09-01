{ config, lib, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.loader.grub.enable = true;
  boot.loader.grub.configurationLimit = 3;
  boot.loader.grub.device = "/dev/sda";

  virtualisation.docker.enable = true;

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    packages = with pkgs; [ tmux vim git gnumake ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC3fGOvvtGnwpYgeNJDFHzHSG2rqDalqvReCMrEHyLUW ksudzilo@c2r13s3.42yerevan.am"
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.interfaces = {
    enp0s8 = {
      ipv4.addresses = [{
        address = "192.168.56.2";
        prefixLength = 24;
      }];
    };
  };

  security.sudo.wheelNeedsPassword = false;

  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;
  networking.firewall.allowedTCPPorts = [ 443 ];

  # Don't change this.
  system.stateVersion = "24.05";
}
