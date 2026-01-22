-- config nvim-dap for debugging
local dap = require('dap')

dap.adapters.python = {
    type = 'executable',
    command = 'venv/bin/python', -- or the full path to python3
    args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",         -- this will debug the current open file
        pythonPath = function()
            return 'venv/bin/python' -- or the path to your python interpreter
        end,
    },
    -- launch current file with arguments
    {
        type = 'python',
        request = 'launch',
        name = "Launch file with args",
        program = "${file}",
        args = function()
            local input = vim.fn.input('Arguments: ')
            return vim.split(input, " ")
        end,
        pythonPath = function()
            return 'venv/bin/python' -- or the path to your python interpreter
        end,
    },
}

local dapui = require('dapui')
dapui.setup()

-- setup up debugging keymaps
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue Debugging" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<leader>dq", dap.close, { desc = "Quit Debugging" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
-- add eval keymap
vim.keymap.set("n", "<leader>?", function()
        dapui.eval()
        dapui.eval()
    end,
    { desc = "Evaluate" }
)
-- remove all breakpoint
vim.keymap.set("n", "<leader>dr", dap.clear_breakpoints, { desc = "Remove All Breakpoints" })
