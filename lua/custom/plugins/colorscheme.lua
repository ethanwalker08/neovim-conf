return {
	{
		enabled = true,
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				show_end_of_buffer = false,
				default_integrations = true,
				dim_inactive = {
					enabled = true,
					shade = "dark",
					percentage = 0.50,
				},
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "bold" },
					loops = {},
					functions = { "bold" },
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = { "bold" },
					properties = { "altfont" },
					types = { "italic" },
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {
					mocha = {
						rosewater = "#ffc0b9",
						flamingo = "#f5aba3",
						pink = "#f592d6",
						mauve = "#c0afff",
						red = "#ea746c",
						maroon = "#ff8595",
						peach = "#fa9a6d",
						yellow = "#ffe081",
						green = "#99d783",
						teal = "#47deb4",
						sky = "#00d5ed",
						sapphire = "#00dfce",
						blue = "#00baee",
						lavender = "#abbff3",
						text = "#cccccc",
						subtext1 = "#bbbbbb",
						subtext0 = "#aaaaaa",
						overlay2 = "#999999",
						overlay1 = "#888888",
						overlay0 = "#777777",
						surface2 = "#666666",
						surface1 = "#555555",
						surface0 = "#444444",
						base = "#202020",
						mantle = "#222222",
						crust = "#333333",
					},
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
