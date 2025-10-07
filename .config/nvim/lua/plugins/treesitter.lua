return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "fatih/vim-go"
    },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = {
                "html", -- required by devdocs
                "vimdoc", "javascript", "typescript", "c", "lua",
                "rust", "jsdoc", "bash", "python", "go"
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            indent = {
                enable = true,
                disable = {"python"}
            },

            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages                
                additional_vim_regex_highlighting = { "markdown" },
            },
        })
        -- For Hugo templates. The templates are called something.html and are interpreter as pure html files
        -- We want the vim-go syntax highlighting for html-go files.
        vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
            group = "filetypedetect",
            pattern = "*.html",
            callback = function()
                local extension = vim.fn.expand("%:e")
                if extension == "html" and vim.fn.search("{{") ~= 0 then
                    vim.bo.filetype = "gohtmltmpl"
                end
            end,
        })
    end
}
