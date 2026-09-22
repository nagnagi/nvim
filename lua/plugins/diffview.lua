return {
  "sindrets/diffview.nvim",
  config = function ()
    require("diffview").setup()
  end,
  lazy = false,
  keys = {
    {mode = "n", "<leader>hh", "<cmd>DiffviewOpen HEAD~1<CR>", desc = "Diff (~)"},
    {mode = "n", "<leader>hf", "<cmd>DiffviewFileHistory %<CR>", desc = "Diff history"},
    {mode = "n", "<leader>hc", "<cmd>DiffviewClose<CR>", desc = "Close diff view"},
    {mode = "n", "<leader>hd", "<cmd>Diffview<CR>", desc = "Open diff view"},
  },
}
