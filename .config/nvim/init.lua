local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.expandtab = true
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4

require("plugins")
require("lsp")
require("nvimcmp")

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
