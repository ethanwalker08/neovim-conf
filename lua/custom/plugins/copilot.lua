return {
	"github/copilot.vim",
	lazy = false,
	config = function()
		vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
	end,
}
