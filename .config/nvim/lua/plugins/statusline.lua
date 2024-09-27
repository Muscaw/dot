return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local lualine = require("lualine")
        lualine.setup({
            sections = {
                lualine_c = {
                    function()
                        return require("auto-session.lib").current_session_name(true)
                    end
                }
            }
        })
    end
}
