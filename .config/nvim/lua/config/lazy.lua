local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.termguicolors = true

local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4


require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "catppuccin-mocha" } },
    checker = { enabled = true },
})

vim.cmd.colorscheme "catppuccin-mocha"
