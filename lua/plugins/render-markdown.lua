return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  ft = { "markdown" },
  keys = {
    { "<Space>sm", ":RenderMarkdown toggle<CR>" },
  },
  opts = {},
  config = function ()
	  vim.keymap.set("n", "<leader>pm", ":RenderMarkdown toggle<cr>")
  end,
}

