return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- Optional image support for file preview: See `# Preview Mode` for more information.
    -- {"3rd/image.nvim", opts = {}},
    -- OR use snacks.nvim's image module:
    -- "folke/snacks.nvim",
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- add options here
	  open_on_setup = true,
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols"
    },
  },
  config = function ()
	  vim.keymap.set("n", "<leader>ee", ":Neotree filesystem reveal focus<cr>", {
      desc="Reveal focus"
    })
	  vim.keymap.set("n", "<leader>ef", ":Neotree filesystem float<cr>", {
      desc="Float"
    })
    vim.keymap.set("n", "<leader>eh", ":Neotree filesystem left<cr>", {
      desc="Left"
    })
    vim.keymap.set("n", "<leader>el", ":Neotree filesystem right<cr>", {
      desc="Right"
    })
    vim.keymap.set("n", "<leader>et", ":Neotree toggle<cr>", {
      desc="Toggle"
    })
    vim.keymap.set("n", "<leader>eb", ":Neotree buffers reveal<cr>", {
      desc="Buffers"
    })
    vim.keymap.set("n", "<leader>es", ":Neotree show<cr>", {
      desc="Show"
    })
  end,
}
