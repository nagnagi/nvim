return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>?",
      function ()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    }
  },
  config = function()
    local wk = require("which-key")

    wk.add({
      -- ===== Find/Fuzzy =====
      { "<leader>f", group = "find" },

      -- ===== Search/Snap (Todo) =====
      { "<leader>s", group = "search/snap" },

      -- ===== Explorer/Edit =====
      { "<leader>e", group = "explorer" },

      -- ===== Buffer =====
      { "<leader>b", group = "buffer" },

      -- ===== Aerial (Symbols) =====
      { "<leader>a", group = "aerial" },

      -- ===== Terminal =====
      { "<leader>t", group = "terminal" },

      -- ===== Run (Overseer) =====
      { "<leader>r", group = "run" },

      -- ===== Memo (Telekasten) =====
      { "<leader>m", group = "memo" },

      -- ===== Zen =====

      -- ===== LSP =====

      -- ===== Preview =====
      { "<leader>p", group = "preview" },

      -- ===== Vibe (AI) =====
      { "<leader>v", group = "vibe" },

      -- ===== Orgmode =====
      { "<leader>o", group = "orgmode" },

      -- ===== Standalone =====
      { "<leader>l", group = "lazy tools" },

      -- ===== Git ===
      { "<leader>h", group = "git" },

      -- ===== GitHub =====
      { "<leader>g", group = "GitHub" },
   })
  end,
}
