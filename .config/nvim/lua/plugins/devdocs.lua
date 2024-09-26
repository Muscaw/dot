local function is_glow_available()
    local handle = io.popen("which glow 2>/dev/null")
    local result = handle:read("*a")
    handle:close()

    return result and result ~= ""
end

return {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter/nvim-treesitter",
        { "ellisonleao/glow.nvim", enabled = is_glow_available() },
    },
    config = function()
        local devdocs = require("nvim-devdocs")
        local devdocs_config = {
            float_win = {
                relative = "editor",
                height = 50,
                width = 120,
                border = "rounded",
            },
        }
        if is_glow_available() then
            devdocs_config["previewer_cmd"] = "glow"
            devdocs_config["cmd_args"] = {
                "-s", "dark", "-w", "80"
            }
        end
        devdocs.setup(devdocs_config)

        vim.keymap.set("n", "<leader>Df", function() devdocs.open_doc_float({ fargs = {} }) end,
            { desc = "open documentation for current file" })
        vim.keymap.set("n", "<leader>Dd", function() devdocs.open_doc_current_file(true) end,
            { desc = "open all documentations" })
    end,
}
