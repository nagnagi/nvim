local function layout_default ()
	vim.cmd("ToggleTerm direction=horizontal size=10", { silent = true })
	vim.cmd("wincmd k")
	vim.cmd("Neotree filesystem show", { silent = true })
end

local function layout_full ()
	vim.cmd("ToggleTerm direction=horizontal size=10", { silent = true })
	vim.cmd("wincmd k")
	vim.cmd("Neotree filesystem show", { silent = true })
	vim.cmd("VibeMistralVibe")
	vim.cmd("wincmd h")
	vim.cmd("AerialOpen")
	vim.cmd("wincmd l")
end

local function layout_orgmode ()
	vim.cmd("Neotree buffers show")
	vim.cmd("AerialOpen right")
	vim.cmd("wincmd h")
	vim.cmd("Org agenda a")
end

local function layout_simple ()
	vim.cmd("only!")
end

vim.api.nvim_create_user_command("LayoutDefault", layout_default, {})
vim.api.nvim_create_user_command("LayoutFull", layout_full, {})
vim.api.nvim_create_user_command("LayoutOrgmode", layout_orgmode, {})
vim.api.nvim_create_user_command("LayoutSimple", layout_simple, {})
