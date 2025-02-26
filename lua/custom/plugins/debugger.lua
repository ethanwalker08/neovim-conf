return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup() -- Ensure DAP UI is set up

		-- Toggle hover-like evaluation on cursor position
		vim.keymap.set("n", "<Leader>dhh", function()
			require("dap.ui.widgets").hover()
		end, { desc = "DAP Hover" })

		vim.keymap.set("n", "<Leader>dhc", function()
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				local config = vim.api.nvim_win_get_config(win)
				if config.relative ~= "" then -- Check if it's a floating window
					vim.api.nvim_win_close(win, true)
				end
			end
		end, { desc = "Close all hover windows" })
	end,
	keys = {
		{ "<F9>", "<cmd>lua require('dap').continue()<cr>", desc = "Continue" },
		{ "<F10>", "<cmd>lua require('dap').step_over()<cr>", desc = "Step Over" },
		{ "<F11>", "<cmd>lua require('dap').step_into()<cr>", desc = "Step Into" },
		{ "<F12>", "<cmd>lua require('dap').step_out()<cr>", desc = "Step Out" },
		{ "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
		{ "<leader>dr", "<cmd>lua require('dap').repl.open()<cr>", desc = "Debugger REPL Open" },
		{ "<leader>dff", "<cmd>FlutterDebug<cr>", desc = "Flutter Debug" },
		{ "<leader>dfr", "<cmd>FlutterReload<cr>", desc = "Flutter Reload" },
		{ "<leader>dfR", "<cmd>FlutterRestart<cr>", desc = "Flutter Restart" },
		{ "<leader>dfq", "<cmd>FlutterQuit<cr>", desc = "Stop Flutter Debug" },
	},
}
