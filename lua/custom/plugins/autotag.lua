return {
	"windwp/nvim-ts-autotag",
	lazy = true,
	event = "InsertEnter", -- Load the plugin when entering insert mode
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
