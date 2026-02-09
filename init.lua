vim.loader.enable()

require("config.lazy")

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

vim.keymap.set("n", ";", ":", {remap = true})

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "jj", "<cr>")


