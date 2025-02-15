return
-- Notify for better notifications in Neovim
{
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup()
		vim.notify = require("notify")
	end,
}
