return {
  'stevearc/overseer.nvim',
  lazy = false,
  keys = {
    { "<leader>rr", "<CMD>OverseerRun<CR>" },
    { "<leader>ro", "<CMD>OverseerOpen<CR>" },
    { "<leader>rt", "<CMD>OverseerToggle<CR>" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function ()
    require("overseer").setup({
      templates = {
        "builtin",
        "user.c_build",
        "user.cpp_build",
        "user.cpp_run",
        "user.docker_build",
        "user.java_build",
        "user.java_run",
        "user.lua_run",
        "user.lualatex_compile",
        "user.python_run",
        "user.typst_compile"
      },
    })
  end,
}
