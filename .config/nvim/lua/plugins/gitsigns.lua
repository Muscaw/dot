return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 0,
            }
        })

        vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns preview_hunk_inline<cr>", { desc = "show diffs" })
        vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "reset hunk" })
        vim.keymap.set("v", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "reset hunk" })

        vim.keymap.set("n", "<leader>ga", "<cmd>Gitsigns stage_hunk<cr>", { desc = "stage hunk" })
        vim.keymap.set("v", "<leader>ga", "<cmd>Gitsigns stage_hunk<cr>", { desc = "stage hunk" })

        vim.keymap.set("n", "<leader>gD", "<cmd>Gitsigns diffthis<cr>", { desc = "open diff for file" })
    end
}
