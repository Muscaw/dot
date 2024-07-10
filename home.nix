{ config, pkgs, ... }:

{
  home.username = "m";
  home.homeDirectory = "/home/m";

  home.packages = with pkgs; [
    nmap

    # languages
    go
    python3
    pipx
  ];

  home.file.".config/alacritty".source = .config/alacritty;
  home.file.".config/Code/User/keybindings.json".source = .config/Code/User/keybindings.json;
  home.file.".config/Code/User/settings.json".source = .config/Code/User/settings.json;
  home.file.".config/i3".source = .config/i3;
  home.file.".config/nvim".source = .config/nvim;
  home.file.".config/picom".source = .config/picom;
  home.file.".config/polybar".source = .config/polybar;
  home.file.".config/ranger".source = .config/ranger;
  home.file.".config/rofi".source = .config/rofi;
  home.file.".config/starship.toml".source = .config/starship.toml;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      gcc
      ripgrep
      unzip
    ];
    plugins = with pkgs.vimPlugins; [
      # catppuccin-nvim
      # nvim-treesitter.withAllGrammars
      # indent-blankline-nvim
      # plenary-nvim
      # telescope-nvim
      # vim-sleuth
      # vim-eunuch
      # heirline-nvim
      # which-key-nvim
      # project-nvim
      #
      # # Neo tree dependencies
      # nvim-web-devicons
      # nui-nvim
      # nvim-window-picker
      # dressing-nvim
      # neo-tree-nvim
      #
      # # comment dependencies
      # comment-nvim
      #
      # # DAP dependencies
      # nvim-dap
      # nvim-dap-ui
      #
      # # nvim-cmp dependencies
      # nvim-lspconfig
      # cmp-buffer
      # cmp-nvim-lsp
      # cmp-path
      # cmp-nvim-lua
      # lspkind-nvim
      # cmp-vsnip
      # vim-vsnip
      # nvim-cmp
    ];
  };
  programs.git = {
    enable = true;
    userName = "Kevin Grandjean";
    userEmail = "moi@kevingrandjean.ch";
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (
      ps: with ps; [
        sane-backends
        rustup
      ]
    );
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
