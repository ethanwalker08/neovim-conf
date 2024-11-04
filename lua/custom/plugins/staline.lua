return {
	"tamton-aquib/staline.nvim",
	config = function()
		require("staline").setup({ defaults = { line_column = "[%l/%L] | :%c | %p%% ", bg = "#3b3b3b" } })
	end,
}
