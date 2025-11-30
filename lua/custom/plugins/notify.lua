-- Config for the nvim-notify plugin to get better looking notifications
return {
	"rcarriga/nvim-notify",
	lazy = false,
	config = function()
		require("notify").setup()
		vim.notify = require("notify")
	end,
}
