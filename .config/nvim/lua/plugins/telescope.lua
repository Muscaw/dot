return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        require("telescope").setup({
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }
                }
            }
        })
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "show project files" })
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "show git files" })
        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "search for word" })
        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "search for WORD" })
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep >") })
        end, { desc = "search for string" })
        vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end
}
