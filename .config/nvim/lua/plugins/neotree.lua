return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
        {
            "<leader>ft", function() vim.cmd("Neotree toggle") end, desc = "show file tree",
        },
    },
    opts = {
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
            },
            follow_current_file = {
                enabled = true,
            },
        },
    }
}
