return (function()
	local is_mac = vim.loop.os_uname().sysname == "Darwin"
	if is_mac then
		return {
			-- Codeium AI Autocomplete for macOS
			"Exafunction/codeium.vim",
			event = "BufEnter",
			config = function()
				vim.g.codeium_disable_bindings = 1 -- Disable default Codeium keybindings

				-- Smart Tab Completion: Codeium -> nvim-cmp -> fallback
				vim.keymap.set("i", "<Tab>", function()
					if vim.fn["codeium#Accept"]() ~= "" then
						return vim.fn["codeium#Accept"]()
					end
					local cmp = require("cmp")
					if cmp.visible() then
						cmp.select_next_item()
					else
						return "<Tab>"
					end
				end, { expr = true, silent = true })
			end,
		}
	else
		return {
			-- GitHub Copilot for Windows
			"github/copilot.vim",
			event = "BufEnter",
			config = function()
				-- Smart Tab Completion: Copilot -> nvim-cmp -> fallback
				vim.keymap.set("i", "<Tab>", function()
					if vim.fn["copilot#Accept"]() ~= "" then
						return vim.fn["copilot#Accept"]()
					end
					local cmp = require("cmp")
					if cmp.visible() then
						cmp.select_next_item()
					else
						return "<Tab>"
					end
				end, { expr = true, silent = true })
			end,
		}
	end
end)()
