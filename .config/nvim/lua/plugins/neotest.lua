return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-go",
        "nvim-neotest/neotest-python",
        "rcasia/neotest-java",
    },
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                }),
                require("neotest-go")({
                    recursive_run = true,
                }),
                -- require("neotest-java")({
                --
                -- })
            }
        })
        vim.keymap.set("n", "<leader>tt", neotest.run.run, { desc = "run test" })
        vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end,
            { desc = "run tests in file" })
        vim.keymap.set("n", "<leader>tp", function() neotest.run.run({vim.fn.getcwd(), true}) end,
            { desc = "run tests in project" })
        vim.keymap.set("n", "<leader>tO", neotest.output_panel.toggle, { desc = "toggle test output panel" })
        vim.keymap.set("n", "<leader>to", function()
            neotest.output.open({ enter = true, short = true, auto_close = true })
            -- if possible add a keymap for esc to close the window if it's focused
        end, { desc = "show test output" })
        vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "show test summary" })
    end
}
