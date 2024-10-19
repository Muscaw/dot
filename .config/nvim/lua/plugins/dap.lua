local utils = require("utils")

return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap",
        "leoluz/nvim-dap-go",
        {
            "Joakker/lua-json5",
            build = "./install.sh",
            enabled = utils.is_bin_available("cargo")
        },
    },
    config = function()
        local vscode = require("dap.ext.vscode")
        if utils.is_bin_available("cargo") then
            vscode.json_decode = require("json5").parse
        end
        local dap = require("dap")
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle breakpoint" })
        vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "continue" })
        vim.keymap.set("n", "<leader>dp", dap.pause, { desc = "pause" })
        vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "step over" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "step into" })
        vim.keymap.set("n", "<leader>dT", dap.terminate, { desc = "terminate" })
        vim.keymap.set("n", "<leader>dR", dap.restart, { desc = "restart" })

        local Hydra = require("hydra")

        -- Define the Hydra
        Hydra({
            name = "Debug",
            mode = "n",
            body = "<leader>dd",
            heads = {
                { "b", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" } },
                { "r", function() dap.continue() end,          { desc = "Continue" } },
                { "p", function() dap.pause() end,             { desc = "Pause" } },
                { "o", function() dap.step_over() end,         { desc = "Step Over" } },
                { "i", function() dap.step_into() end,         { desc = "Step Into" } },
                { "T", function() dap.terminate() end,         { desc = "Terminate" } },
                { "R", function() dap.restart() end,           { desc = "Restart" } },
            },
        })

        local dap_go = require("dap-go")
        dap_go.setup()

        local dapui = require("dapui")
        dapui.setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open("sidebar")
        end

        dap.listeners.before.launch.dapui_config = function()
            dapui.open("sidebar")
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end


        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "toggle ui" })

        vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
    end
}
