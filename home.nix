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
      ps: with ps; []
    );
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
