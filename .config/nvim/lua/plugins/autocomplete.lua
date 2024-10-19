return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "RRethy/vim-illuminate"
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        local function create_keymap(key, command, bufnr, desc)
            vim.keymap.set("n", key, command, {buffer = bufnr, desc = desc })
        end

        local lsp_attach = function(_, bufnr)
            create_keymap("<leader>sS", "<cmd>lua vim.lsp.buf.hover()<cr>", bufnr, "Show information")
            create_keymap("<leader>sd", "<cmd>lua vim.lsp.buf.definition()<cr>", bufnr, "Go to definition")
            create_keymap("<leader>sD", "<cmd>lua vim.lsp.buf.declaration()<cr>", bufnr, "Go to declaration")
            create_keymap("<leader>si", "<cmd>lua vim.lsp.buf.implementation()<cr>", bufnr, "Go to implementation")
            create_keymap("<leader>so", "<cmd>lua vim.lsp.buf.type_definition()<cr>", bufnr, "Go to type definition")
            create_keymap("<leader>sr", function() require("telescope.builtin").lsp_references() end, bufnr, "Show references")
            create_keymap("<leader>ss", "<cmd>lua vim.lsp.buf.signature_help()<cr>", bufnr, "Show signature help")
            create_keymap("<leader>rr", "<cmd>lua vim.lsp.buf.rename()<cr>", bufnr, "Rename")
            create_keymap("<A-CR>", "<cmd>lua vim.lsp.buf.code_action()<cr>", bufnr, "Show code action")
        end
        lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = lsp_attach,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        require("mason").setup({})
        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            }
        })

        -- cmp config
        local cmp = require("cmp")
        local cmp_action = require("lsp-zero").cmp_action()
        cmp.setup({
            sources = {
                {name = "nvim_lsp"},
                {name = "luasnip"},
            },
            mapping = cmp.mapping.preset.insert({
                -- Navigation between items
                ["<S-Tab>"] = cmp.mapping.select_prev_item({behavior = "select"}),
                ["<Tab>"] = cmp.mapping.select_next_item({behavior = "select"}),

                -- Enter to validate completion
                ["<CR>"] = cmp.mapping.confirm({select = false}),

                -- Ctrl + Space starts the completion popup
                ["<C-Space>"] = cmp.mapping.complete(),

                -- Navigate between snippet placeholder
                ["<C-f>"] = cmp_action.vim_snippet_jump_forward(),
                ["<C-b>"] = cmp_action.vim_snippet_jump_backward(),

                -- Scroll in completion documentation
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),

            }),
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
        })

        require("illuminate").configure({delay = 0})
    end
}
