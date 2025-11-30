return {
	-- nvim-cmp for autocompletion
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		"hrsh7th/cmp-buffer", -- Buffer completions
		"hrsh7th/cmp-path", -- Path completions
		"hrsh7th/cmp-cmdline", -- Command line completions
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			completion = {
				-- Only show completions if we've typed at least 2 characters and not on a whitespace
				autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
				keyword_length = 2,
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Up>"] = cmp.mapping.select_prev_item(), -- Up arrow for previous completion
				["<Down>"] = cmp.mapping.select_next_item(), -- Down arrow for next completion
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
