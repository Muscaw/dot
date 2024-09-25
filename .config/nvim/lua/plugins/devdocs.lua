return {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    config = function()
        local devdocs = require("nvim-devdocs")
        devdocs.setup()

        vim.keymap.set("n", "<leader>Df", function() devdocs.open_doc_float({ fargs = {} }) end,
            { desc = "open documentation for current file" })
        vim.keymap.set("n", "<leader>Dd", function() devdocs.open_doc_current_file(true) end,
            { desc = "open all documentations" })
    end
}
