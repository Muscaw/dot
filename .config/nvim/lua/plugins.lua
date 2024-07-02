
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
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        }
    }
    use "beauwilliams/statusline.lua"
    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"}
    }
end)
