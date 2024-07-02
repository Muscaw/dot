{ config, pkgs, ... }:

{
  home.username = "m";
  home.homeDirectory = "/home/m";

  home.packages = with pkgs; [
    nmap
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = [ pkgs.gcc ];
    plugins = with pkgs.vimPlugins; [
        nvim-treesitter.withAllGrammars
        catppuccin-nvim
    ];
  };
  programs.git = {
    enable = true;
    userName = "Kevin Grandjean";
    userEmail = "moi@kevingrandjean.ch";
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
