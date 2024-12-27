return {
    "stevearc/conform.nvim",
    keys = {
        {
            "<C-A-l>",
            function()
                require("conform").format({async = true})
            end,
            desc = "format"
        }
    },
    opts = {
        formatters_by_ft = {
            lua = {"stylua"},
            python = {"ruff_format", "ruff_fix", "ruff_organize_imports"},
            gohtmltmpl = {"prettier"}
        }
    },
}
