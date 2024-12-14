return {
    "voldikss/vim-floaterm",
    config = function()
        vim.keymap.set("n", "<leader>'n", "<cmd>:FloatermNew!<cr>", { desc = "New terminal" })
        vim.keymap.set("n", "<leader>'t", "<cmd>:FloatermToggle!<cr>", { desc = "Toggle terminal" })
        vim.keymap.set("t", "<C-0>", "<cmd>:FloatermToggle!<cr>", { desc = "Toggle terminal" })
        vim.keymap.set("n", "<C-0>", "<cmd>:FloatermToggle!<cr>", { desc = "Toggle terminal" })
    end
}
