return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        suppressed_dirs = { "~/", "/", "~/Downloads" },
        session_lens = {
            load_on_setup = true,
        }
    },
    keys = {
        {
            "<leader>pp", "<cmd>:SessionSearch<CR>", { noremap = true, desc = "list sessions" }
        }
    }
}
