vim.loader.enable()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins",
{
	ui = {
		icons = {
			cmd = "⌘",
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
	checker = {
		enabled = true, -- プラグインのアップデートを自動的にチェック
	},
	diff = {
		cmd = "delta",
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
})

require("lualine").setup()

vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.o.updatetime = 500
-- vim.cmd("colorscheme onedark")
vim.cmd("colorscheme catppuccin-mocha")
vim.cmd("Neotree")

-- -- open File Tree when open
-- local function open_nvim_tree()
    -- require("nvim-tree.api").tree.open()
-- end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "jj", "<cr>")

