return {
	-- Codeium AI Autocomplete
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
