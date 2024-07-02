local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.number = true

opt.expandtab = true
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4

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

require("plugins")
require("lsp")
require("nvimcmp")
require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
    }
}

vim.cmd([[colorscheme catppuccin]])

vim.cmd([[
    so ~/.config/nvim/keys.vim
]])

require("nvim-tree").setup()


local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)
require("ibl").setup {
    indent = { highlight = highlight }
}
