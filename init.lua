vim.loader.enable()

vim.pack.add({
  { src = "git@github.com:nvim-lua/plenary.nvim.git" },
  { src = "git@github.com:nvim-tree/nvim-web-devicons.git" },
  { src = "git@github.com:MunifTanjim/nui.nvim.git" },
  { src = "git@github.com:lewis6991/gitsigns.nvim.git" },
  { src = "git@github.com:nvim-neo-tree/neo-tree.nvim.git" },
  { src = "git@github.com:nvim-telescope/telescope.nvim.git" },
  { src = "git@github.com:nvim-lualine/lualine.nvim.git" },
  { src = "git@github.com:akinsho/bufferline.nvim.git" },
  { src = "git@github.com:akinsho/toggleterm.nvim.git" },
})

require("gitsigns").setup();
require("lualine").setup({
  options = {
    globalstatus = true
  },
});
require("toggleterm").setup({});
require("bufferline").setup({});

-- ckeymap
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true })
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true })
vim.keymap.set('c', '<C-d>', '<Del>', { noremap = true })
vim.keymap.set('c', '<C-k>', '<C-o>D', { noremap = true })

-- ikeymap
vim.keymap.set("i", "jk", "<esc>", { desc = '[Insert] ノーマルモードへ' })
vim.keymap.set("i", "jj", "<cr>", { desc = '[Insert] 改行' })
vim.keymap.set("i", "jh", "<BS>", { desc = '[Insert] バックスペース' })
vim.keymap.set("i", "jl", "<Del>", { desc = '[Insert] デリート' })

vim.keymap.set("i", "<C-f>", "<right>", { noremap = true })
vim.keymap.set("i", "<C-b>", "<left>",  { noremap = true })
vim.keymap.set("i", "<C-a>", "<Home>", { noremap = true })
vim.keymap.set("i", "<C-e>", "<End>",  { noremap = true })
vim.keymap.set("i", "<C-d>", "<Del>",  { noremap = true })

-- nkeymap
vim.keymap.set("n", "<C-j><C-x>", "<cmd>q<cr>")
vim.keymap.set("n", "<C-j><C-w>", "<cmd>w<cr>")
vim.keymap.set({"n", "i", "v"}, "<F1>", "<nop>")

vim.keymap.set("n", "<C-j><C-f>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<C-j><C-g>", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<C-j><C-e>", "<cmd>Neotree focus<cr>")
vim.keymap.set("n", "<C-j><C-t>", "<cmd>ToggleTerm<cr>")

vim.keymap.set("n", "<leader><leader>d", "<cmd>LayoutDefault<cr>")
vim.keymap.set("n", "<leader><leader>f", "<cmd>LayoutFull<cr>")


-- config
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.o.updatetime = 1000
vim.env.MASON_PYTHON = "/home/nag/.local/bin/python3.13"

-- fold settings
-- vim.o.foldenable = true
-- vim.o.foldmethod = "indent"
-- vim.opt.foldcolumn = "1"
-- vim.o.foldlevel = 99
-- vim.opt.fillchars:append({
--     fold = " ",
--     foldopen = "",
--     foldsep = " ",
--     foldclose = "",
-- })

-- indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.cindent = true

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- cursor
vim.opt.cursorline = true
-- opt.cursorculumn = true

-- color
vim.opt.termguicolors = true
-- vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd("colorscheme onedark")


