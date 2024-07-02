local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.number = true

opt.expandtab = true
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4


require("plugins")
require("lsp")
require("nvimcmp")

vim.cmd([[colorscheme catppuccin]])

require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
    }
}

require("nvim-tree").setup()

vim.cmd([[
    so ~/.config/nvim/keys.vim
]])

require("nvim-tree").setup()

vim.api.nvim_create_augroup("nix_indent", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
    group = "nix_indent",
    pattern = "*.nix",
    callback = function()
        vim.opt_local_shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.expandtab = true
    end,
})
