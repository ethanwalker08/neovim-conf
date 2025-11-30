return {
	"f-person/git-blame.nvim",
	enabled = vim.api.nvim_get_mode().mode == "n", -- only enable in normal mode
	-- load the plugin at startup
	event = "VeryLazy",
	-- Because of the keys part, you will be lazy loading this plugin.
	-- The plugin will only load once one of the keys is used.
	-- If you want to load the plugin at startup, add something like event = "VeryLazy",
	-- or lazy = false. One of both options will work.
	opts = {
		-- your configuration comes here
		enabled = true, -- if you want to enable the plugin
		message_template = "	<date>: <summary>", -- template for inline blame
		date_format = "%r", -- template for the date, check Date format section for more options
		message_when_not_committed = "Unstaged changes",
		gitblame_delay = 500, -- delay in milliseconds, 500 = show blame after half a second
		gitblame_max_commit_summary_length = 75, -- character limit for commit summaries to show
	},
}
