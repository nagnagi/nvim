-- config
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.o.updatetime = 1000
vim.env.MASON_PYTHON = "/home/nag/.local/bin/python3.13"
vim.o.exrc = true
vim.o.secure = true

-- vim.opt.list = true
-- vim.opt.listchars = { tab = '> ', eol = '$' }

-- fold settings
-- vim.o.foldenable = true
-- vim.o.foldmethod = "indent"
-- vim.opt.foldcolumn = "1"
-- vim.o.foldlevel = 99
-- vim.opt.fillchars:append({
    -- fold = " ",
    -- foldopen = "v",
    -- foldsep = " ",
    -- foldclose = ">",
-- })

-- indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.o.fixendofline = true
vim.o.endofline = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- cursor
vim.opt.cursorline = true
-- opt.cursorculumn = true
vim.o.scrolloff = 5
vim.o.scrolljump = 20

-- color
vim.opt.termguicolors = true
vim.cmd("colorscheme catppuccin-mocha")

-- plugin
vim.cmd("packadd nvim.undotree")

