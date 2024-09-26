function setup_tabby()
    local theme = {
        fill = 'TabLineFill',
        -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
        head = 'TabLine',
        -- current_tab = 'TabLineSel',
        current_tab = { fg = '#F8FBF6', bg = '#896a98', style = 'italic' },
        tab = 'TabLine',
        win = 'TabLine',
        tail = 'TabLine',
    }

    require('tabby.tabline').set(function(line)
        return {
            {
                { '  ', hl = theme.head },
                line.sep('', theme.head, theme.fill),
            },
            line.tabs().foreach(function(tab)
                local hl = tab.is_current() and theme.current_tab or theme.tab
                return {
                    line.sep('', hl, theme.fill),
                    tab.is_current() and '' or '',
                    tab.number(),
                    tab.name(),
                    -- tab.close_btn(''), -- show a close button
                    line.sep('', hl, theme.fill),
                    hl = hl,
                    margin = ' ',
                }
            end),
            line.spacer(),
            -- shows list of windows in tab
            -- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            --   return {
            --     line.sep('', theme.win, theme.fill),
            --     win.is_current() and '' or '',
            --     win.buf_name(),
            --     line.sep('', theme.win, theme.fill),
            --     hl = theme.win,
            --     margin = ' ',
            --   }
            -- end),
            {
                line.sep('', theme.tail, theme.fill),
                { '  ', hl = theme.tail },
            },
            hl = theme.fill,
        }
    end)
end

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
        map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
        map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
        map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
        map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
        map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
        map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
        map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
        map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
        map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
        map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
        --
        -- Close tab
        map("n", "<A-c>", ":tabclose<CR>", opts)
        -- New tab
        map("n", "<A-n>", ":$tabnew<CR>", opts)
        -- Picker
        map("n", "<A-p>", "<Cmd>Tabby jump_to_tab<CR>", opts)
        --setup_tabby()
    end,
}
