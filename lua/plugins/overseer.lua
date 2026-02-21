return {
  'stevearc/overseer.nvim',
  lazy = false,
  keys = {
    { "<leader>rr", "<CMD>OverseerRun<CR>" },
    { "<leader>rt", "<CMD>OverseerToggle<CR>" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function ()
    require("overseer").setup({
      templates = {
        "builtin",
        "user.cpp_build"
      },
    })
  end,
}
