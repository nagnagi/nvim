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
      weeklies = vim.fn.expand("~/zettelkasten/weekly"),
      todolist = vim.fn.expand("~/zettelkasten/todo")

    })

    -- Launch panel if nothing is typed after <leader>z
    vim.keymap.set("n", "<leader>mm", "<cmd>Telekasten panel<CR>", {
      desc="Panel"
    })

    -- Most used functions
    vim.keymap.set("n", "<leader>mf", "<cmd>Telekasten find_notes<CR>", {
      desc="Find notes"
    })
    vim.keymap.set("n", "<leader>mg", "<cmd>Telekasten search_notes<CR>", {
      desc="Search notes"
    })
    vim.keymap.set("n", "<leader>md", "<cmd>Telekasten goto_today<CR>", {
      desc="Goto today"
    })
    vim.keymap.set("n", "<leader>mz", "<cmd>Telekasten follow_link<CR>", {
      desc="Follow link"
    })
    vim.keymap.set("n", "<leader>mn", "<cmd>Telekasten new_note<CR>", {
      desc="New note"
    })
    vim.keymap.set("n", "<leader>mc", "<cmd>Telekasten show_calendar<CR>", {
      desc="Show calendar"
    })
    vim.keymap.set("n", "<leader>mb", "<cmd>Telekasten show_backlinks<CR>", {
      desc="Show backlinks"
    })
    vim.keymap.set("n", "<leader>mI", "<cmd>Telekasten insert_img_link<CR>", {
      desc="Insert image"
    })

    -- Call insert link automatically when we start typing a link
    vim.keymap.set("n", "<leader>ml", "<cmd>Telekasten insert_link<CR>", {
      desc="Insert link"
    })

  end
}
