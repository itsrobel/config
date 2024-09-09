{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_:true);
      };
  };

  #nixpkgs.overlays = [
  #  (import (builtins.fetchTarball https://github.com/nix-community/emacs-overlay/archive/master.tar.gz))
  #];
  home.username = "stef";
  home.homeDirectory = "/home/stef";

  xdg.portal = {
    config.common.default = "*";
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    xdgOpenUsePortal = true;
  };
  # xdg.portal = {
  #   config.common.default = "*";
  #   # xdgOpenUsePortal = true;
  #   enable = true;
  #   # wlr.enable = true;
  #   # lxqt.enable = true;
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-gtk
  #     pkgs.xdg-desktop-portal-gnome
  #     pkgs.xdg-desktop-portal-hyprland
  #   ];
  # };
  home.packages = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    xdg-desktop-portal-hyprland
    spotify
    htop
    obsidian
    discord
    brave
    firefox
    zathura
    zoxide
    eza
    lxappearance
    stow
    lazygit
    neovim
    texlivePackages.latexmk
    texlivePackages.bibtex
    tree-sitter
    ruby
    cargo
    biber
    waybar
    julia
    zulu
    php
    kitty
    zsh
    zig
    tmux
    fastfetch
    go
    lua
    nodejs_22
    python3
    python311Packages.pip
    wofi
    clang
    fd
    fzf
    coreutils
    ripgrep
    emacs
    catppuccin-gtk
    catppuccin-sddm
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin";
      package = pkgs.catppuccin-gtk;
    };
  };
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  #programs.emacs = {
  #  enable = true;
  #  extraPackages = epkgs: [
  #    epkgs.nix-mode
  #    epkgs.magit
  #  ];
  #};
}
