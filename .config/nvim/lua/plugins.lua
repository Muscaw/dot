
return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"
    use {
    "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        }
    }
    use "ellisonleao/gruvbox.nvim"
end)
