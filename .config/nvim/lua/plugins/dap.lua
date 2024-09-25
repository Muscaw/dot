return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap",
        "leoluz/nvim-dap-go",
        {
            "Joakker/lua-json5",
            build = "./install.sh"
        },
    },
    config = function()
        local vscode = require("dap.ext.vscode")
        vscode.json_decode = require("json5").parse
        local dap = require("dap")
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle breakpoint" })
        vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "continue" })
        vim.keymap.set("n", "<leader>dp", dap.pause, { desc = "pause" })
        vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "step over" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "step into" })
        vim.keymap.set("n", "<leader>dT", dap.terminate, { desc = "terminate" })
        vim.keymap.set("n", "<leader>dR", dap.restart, { desc = "restart" })


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
    end
}
