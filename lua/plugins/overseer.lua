return {
  'stevearc/overseer.nvim',
  keys = {
    { "<leader>rr", "<CMD>OverseerRun<CR>" },
    { "<leader>rt", "<CMD>OverseerToggle<CR>" },
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
