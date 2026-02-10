-- [[maybe unused]]
return {
  "nvim-telekasten/telekasten.nvim",
  dependencies = {
    "mattn/calendar-vim"
  },
  config = function ()
    require("telekasten").setup({
      home = vim.fn.expand("~/zettelkasten"),
      dailies = vim.fn.expand("~/zettelkasten/daily"),
      templates = vim.fn.expand("~/zettelkasten/templates"),
      media = vim.fn.expand("~/zettelkasten/media"),
      tags = vim.fn.expand("~/zettelkasten/tags"),
      weeklies = vim.fn.expand("~/zk/weekly"),
      todolist = vim.fn.expand("~/zk/todo")

    })

    -- Launch panel if nothing is typed after <leader>z
    vim.keymap.set("n", "<leader>mm", "<cmd>Telekasten panel<CR>")

    -- Most used functions
    vim.keymap.set("n", "<leader>mf", "<cmd>Telekasten find_notes<CR>")
    vim.keymap.set("n", "<leader>mg", "<cmd>Telekasten search_notes<CR>")
    vim.keymap.set("n", "<leader>md", "<cmd>Telekasten goto_today<CR>")
    vim.keymap.set("n", "<leader>mz", "<cmd>Telekasten follow_link<CR>")
    vim.keymap.set("n", "<leader>mn", "<cmd>Telekasten new_note<CR>")
    vim.keymap.set("n", "<leader>mc", "<cmd>Telekasten show_calendar<CR>")
    vim.keymap.set("n", "<leader>mb", "<cmd>Telekasten show_backlinks<CR>")
    vim.keymap.set("n", "<leader>mI", "<cmd>Telekasten insert_img_link<CR>")

    -- Call insert link automatically when we start typing a link
    vim.keymap.set("i", "<leader>ml", "<cmd>Telekasten insert_link<CR>")

  end
}
