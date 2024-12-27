local function close_current_window()
    local win_id = vim.api.nvim_get_current_win()
    vim.api.nvim_win_close(win_id, false)
end

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "show netrw" })
vim.keymap.set("n", "<leader>w/", function() vim.api.nvim_command("vsplit") end, { desc = "split window vertically" })
vim.keymap.set("n", "<leader>w-", function() vim.api.nvim_command("split") end, { desc = "split window horizontally" })
vim.keymap.set("n", "<leader>wd", close_current_window, { desc = "close window" })

vim.keymap.set("n", "<leader><TAB>", ":b#<CR>", { desc = "Jump to previous buffer", noremap = true, silent = true })
