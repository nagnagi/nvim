vim.loader.enable()

require("config.lazy")

vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.o.updatetime = 500
-- vim.cmd("colorscheme onedark")
vim.cmd("colorscheme catppuccin-mocha")

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "jj", "<cr>")

require("user.vibe")

