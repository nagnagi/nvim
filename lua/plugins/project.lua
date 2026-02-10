return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = {
        ".git",
        "package.json",
        "Makefile",
        "go.mod",
        "Cargo.toml",
        ".gitignore",
      },
      ignore_lsp = {},
      exclude_dirs = {},
      show_hidden = false,
      silent_chdir = true,
      datapath = vim.fn.stdpath("data"),
    })

    local telescope = require("telescope")
    telescope.load_extension("projects")

    vim.keymap.set("n", "<leader>fp", "<CMD>Telescope projects<CR>", { desc = "Telescope projects" })
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}
