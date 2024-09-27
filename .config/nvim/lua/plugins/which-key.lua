return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {

    },
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc =
            "Buffer Local Keymaps (which-key)",
        }
    },
    config = function()
        local wk = require("which-key")
        wk.add({
            { "<leader>s",  group = "symbol" },
            { "<leader>g",  group = "git" },
            { "<leader>c",  group = "config" },
            { "<leader>p",  group = "project" },
            { "<leader>w",  group = "window" },
            { "<leader>x",  group = "problem" },
            { "<leader>r",  group = "refactor" },
            { "<leader>t",  group = "test" },
            { "<leader>d",  group = "debug" },
            { "<leader>pw", group = "word search" }
        })
    end
}
