return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sharkdp/fd",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        "ahmedkhalf/project.nvim",
    },

    config = function()
        local telescope = require("telescope")
        telescope.setup({
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
            }
        })
        -- require("project_nvim").setup {
        --     show_hidden = true
        -- }
        telescope.load_extension("fzf")
        -- telescope.load_extension("projects")
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
            builtin.grep_string({ search = vim.fn.input("Grep >"), additional_args = { "--hidden" } })
        end, { desc = "search for string" })
        vim.keymap.set("n", "<leader>vh", builtin.help_tags, {desc = "show vim commands"})

        -- project
        -- vim.keymap.set("n", "<leader>pp", ":lua require'telescope'.extensions.projects.projects{}<CR>", { desc = "projects" })
    end
}
