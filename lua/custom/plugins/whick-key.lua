return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	opts = {
		icons = {
			-- set icon mappings to true if you have a Nerd Font
			mappings = vim.g.have_nerd_font,
		},
		spec = {
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>w", group = "[W]rite" },
			{ "<leader>g", group = "[G]oto" },
			{ "<leader>l", group = "[L]azyGit" },
			{ "<leader>x", group = "View Issues" },
			{ "<leader>q", group = "[Q]uit" },
			{ "<leader>c", group = "[C]ode [A]ctions" },
			{ "<leader>d", group = "[D]ebugger" },
			{ "<leader>dh", group = "[D]ebug [H]over variables" },
			{ "<leader>df", group = "[D]ebug [F]lutter" },
		},
	},
}
