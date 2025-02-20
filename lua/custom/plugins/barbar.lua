return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: if you use gitsigns
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = true
		vim.api.nvim_set_keymap("n", "<leader>qb", "<Cmd>BufferClose<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>qq", ":q<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>w", ":w<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-Right>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-Left>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
	end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		insert_at_start = true,
		-- …etc.
	},
}
