return {
    'nanozuki/tabby.nvim',
    -- event = 'VimEnter', -- if you want lazy load, see below
    enabled = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local tabby = require("tabby")
        tabby.setup({
            preset = 'active_wins_at_tail',
            option = {
                theme = {
                    fill = 'TabLineFill', -- tabline background
                    head = 'TabLine', -- head element highlight
                    current_tab = 'TabLineSel', -- current tab label highlight
                    tab = 'TabLine', -- other tab label highlight
                    win = 'TabLine', -- window highlight
                    tail = 'TabLine', -- tail element highlight
                },
                nerdfont = true,  -- whether use nerdfont
                lualine_theme = nil, -- lualine theme name
                tab_name = {
                    name_fallback = function(tabid)
                        return tabid
                    end,
                },
                buf_name = {
                    mode = "'unique'|'relative'|'tail'|'shorten'",
                },
            },
        })

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }


        -- Move to previous/next
        map('n', '<A-,>', ':tabp<CR>', opts)
        map('n', '<A-.>', ':tabn<CR>', opts)
        -- Re-order to previous/next
        map('n', '<A-S-h>', ':-tabmove<CR>', opts)
        map('n', '<A-S-l>', ':+tabmove<CR>', opts)
        -- Goto buffer in position...
        map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
        map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
        map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
        map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
        map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
        map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
        map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
        map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
        map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
        map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
        -- Pin/unpin buffer
        map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
        -- Goto pinned/unpinned buffer
        --                 :BufferGotoPinned
        --                 :BufferGotoUnpinned
        -- Close buffer
        map('n', '<A-c>', ':tabclose<CR>', opts)
    end,
}
