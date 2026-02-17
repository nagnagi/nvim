vim.keymap.set("i", "jk", "<esc>", { desc = '[Insert] ノーマルモードへ' })
vim.keymap.set("i", "jj", "<cr>", { desc = '[Insert] 改行' })
vim.keymap.set("i", "jh", "<BS>", { desc = '[Insert] バックスペース' })
vim.keymap.set("i", "jl", "<Del>", { desc = '[Insert] デリート' })

vim.keymap.set("i", "<C-f>", "<right>", { noremap = true })
vim.keymap.set("i", "<C-b>", "<left>",  { noremap = true })
vim.keymap.set("i", "<C-a>", "<Home>", { noremap = true })
vim.keymap.set("i", "<C-e>", "<End>",  { noremap = true })
vim.keymap.set("i", "<C-d>", "<Del>",  { noremap = true })
vim.keymap.set('i', '<C-k>', '<C-o>D', { noremap = true })

