return {
    "nvimtools/hydra.nvim",
    config = function()
        require("hydra").setup({
            debug = true,
        })
        local Hydra = require("hydra")
        Hydra({
            name = "resize",
            mode = "n",
            body = "<leader>ws",
            config = {
                desc = "resize",
                invoke_on_body=true
            },
            heads = {
                {"U", "<cmd>:vertical resize +10<cr>", { desc = "increase horizontal size"}},
                {"u", "<cmd>:vertical resize -10<cr>", {desc = "decrease horizontal size"}},
                {"Z", "<cmd>:resize +10<cr>", { desc = "increase vertical size"}},
                {"z", "<cmd>:resize -10<cr>", { desc = "decrease vertical size"}},
                {"=", "<cmd>:wincmd =<cr>", {desc = "make all panes equal size"}}
            },
        })
    end
}
