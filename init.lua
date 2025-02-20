vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.number = true

vim.opt.mouse = "a"

vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

vim.opt.termguicolors = true

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	{ import = "custom.plugins" },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

local telescope = require("telescope.builtin")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

function new_directory_with_telescope()
	telescope.find_files({
		prompt_title = "Select Directory",
		cwd = vim.fn.getcwd(), -- Start in the current working directory
		find_command = {
			"powershell",
			"-Command",
			"Get-ChildItem -Directory -Recurse | Select-Object -ExpandProperty FullName",
		}, -- Use PowerShell to list directories only
		attach_mappings = function(_, map)
			map("i", "<CR>", function(bufnr)
				local selection = action_state.get_selected_entry()
				actions.close(bufnr)
				local dir_path = selection and selection.path or vim.fn.input("Enter directory path: ", "./")
				local file_name = vim.fn.input("File name: ")

				if dir_path ~= "" and file_name ~= "" then
					vim.cmd("edit " .. dir_path .. "\\" .. file_name)
				else
					print("Directory or file name not provided.")
				end
			end)
			return true
		end,
	})
end

-- Map <leader>n to use Telescope for new directory selection and file creation
vim.api.nvim_set_keymap(
	"n",
	"<leader>n",
	":lua new_directory_with_telescope()<CR>",
	{ noremap = true, silent = true, desc = "[N]ew file" }
)

-- Function to rename the current file
function rename_current_file()
	-- Get the full path of the current file
	local current_file = vim.api.nvim_buf_get_name(0)

	if current_file == "" then
		print("No file in current buffer.")
		return
	end

	-- Prompt for a new name
	local new_name = vim.fn.input("New name: ", vim.fn.fnamemodify(current_file, ":t"))

	-- If a new name is provided, rename the file
	if new_name ~= "" then
		local dir_path = vim.fn.fnamemodify(current_file, ":h")
		local new_path = dir_path .. "/" .. new_name

		-- Rename the file
		local success, err = os.rename(current_file, new_path)
		if success then
			-- Update the buffer to the new file path
			vim.cmd("edit " .. new_path)
			print("File renamed to " .. new_path)
		else
			print("Error renaming file: " .. err)
		end
	else
		print("No new name provided.")
	end
end

-- Map <leader>R to rename the current file
vim.api.nvim_set_keymap(
	"n",
	"<leader>R",
	":lua rename_current_file()<CR>",
	{ noremap = true, silent = true, desc = "[R]ename current file" }
)

function create_sveltekit_route()
	-- Prompt for the directory where the new route should go
	local route_directory = vim.fn.input("Route directory (relative to src/routes/): ", "", "file")
	if route_directory == "" then
		print("No directory provided.")
		return
	end

	-- Prompt for the route name
	local route_name = vim.fn.input("Route name: ")
	if route_name == "" then
		print("No route name provided.")
		return
	end

	-- Define the full path for the new route
	local base_path = "src/routes/" .. route_directory .. "/" .. route_name
	local svelte_file = base_path .. "/+page.svelte"
	local server_file = base_path .. "/+page.server.ts"

	-- Create the route directory if it doesn't exist
	vim.fn.mkdir(base_path, "p")

	-- Add boilerplate content for +page.svelte
	local svelte_content = [[
<script>
  // Add your component logic here
</script>

<h1>]] .. route_name .. [[</h1>
<p>This is the new SvelteKit route for ]] .. route_name .. [[.</p>
]]
	local server_content = [[
// +page.server.ts for route ]] .. route_name .. [[

export const load = async () => {
  return {
    // Your data here
  };
};
]]

	-- Write the +page.svelte file
	local svelte_file_handle = io.open(svelte_file, "w")
	svelte_file_handle:write(svelte_content)
	svelte_file_handle:close()

	-- Write the +page.server.ts file
	local server_file_handle = io.open(server_file, "w")
	server_file_handle:write(server_content)
	server_file_handle:close()

	print("SvelteKit route created at " .. base_path)
end

-- Map <leader>N to create a new SvelteKit route
vim.api.nvim_set_keymap(
	"n",
	"<leader>N",
	":lua create_sveltekit_route()<CR>",
	{ noremap = true, silent = true, desc = "[N]ew SvelteKit Route" }
)
require("lspconfig").denols.setup({})

-- if language is js or ts then tabstop = 2 else tabstop = 4
if vim.bo.filetype == "javascript" or vim.bo.filetype == "typescript" then
	vim.bo.tabstop = 2
	vim.bo.shiftwidth = 2
else
	vim.bo.tabstop = 4
	vim.bo.shiftwidth = 4
end
