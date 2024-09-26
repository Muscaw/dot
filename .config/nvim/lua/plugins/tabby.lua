return {
    'nanozuki/tabby.nvim',
    -- event = 'VimEnter', -- if you want lazy load, see below
    enabled = true,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local tabby = require("tabby")
        tabby.setup({
            preset = "active_wins_at_tail",
        })

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }


        -- Move to previous/next
        map("n", "<A-,>", ":tabp<CR>", opts)
        map("n", "<A-.>", ":tabn<CR>", opts)
        map("n", "<A-h>", ":tabp<CR>", opts)
        map("n", "<A-l>", ":tabn<CR>", opts)
        -- Re-order to previous/next
        map("n", "<A-S-h>", ":-tabmove<CR>", opts)
        map("n", "<A-S-l>", ":+tabmove<CR>", opts)
        -- Goto buffer in position...
        map("n", "<A-1>", "<Cmd>:tabn 1<CR>", opts)
        map("n", "<A-2>", "<Cmd>:tabn 2<CR>", opts)
        map("n", "<A-3>", "<Cmd>:tabn 3<CR>", opts)
        map("n", "<A-4>", "<Cmd>:tabn 4<CR>", opts)
        map("n", "<A-5>", "<Cmd>:tabn 5<CR>", opts)
        map("n", "<A-6>", "<Cmd>:tabn 6<CR>", opts)
        map("n", "<A-7>", "<Cmd>:tabn 7<CR>", opts)
        map("n", "<A-8>", "<Cmd>:tabn 8<CR>", opts)
        map("n", "<A-9>", "<Cmd>:tabn 9<CR>", opts)
        map("n", "<A-0>", "<Cmd>:$tabn<CR>", opts)
        --
        -- Close tab
        map("n", "<A-c>", ":tabclose<CR>", opts)
        -- New tab
        map("n", "<A-n>", ":$tabnew<CR>", opts)
        -- Picker
        map("n", "<A-p>", "<Cmd>Tabby jump_to_tab<CR>", opts)
    end,
}
