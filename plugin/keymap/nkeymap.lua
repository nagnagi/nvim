vim.keymap.set("n", "<C-j><C-x>", "<cmd>q<cr>")
vim.keymap.set("n", "<C-j><C-w>", "<cmd>w<cr>")
vim.keymap.set({ "n", "i", "v" }, "<F1>", "<nop>")

vim.keymap.set("n", "<C-j><C-f>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<C-j><C-g>", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<C-j><C-e>", "<cmd>Neotree focus<cr>")
vim.keymap.set("n", "<C-j><C-t>", "<cmd>ToggleTerm<cr>")

vim.keymap.set("n", "<C-n>", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<C-p>", "<cmd>tabprevious<cr>")

vim.keymap.set("n", "<leader><leader>d", "<cmd>LayoutDefault<cr>")
vim.keymap.set("n", "<leader><leader>f", "<cmd>LayoutFull<cr>")

vim.keymap.set("n", "U", "<cmd>Undotree<cr>")
