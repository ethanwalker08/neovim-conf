return {
	-- GitHub Copilot
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
