return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    local wk = require("which-key")

    wk.add({
      -- ===== Find/Fuzzy =====
      { "<leader>f", group = "find" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },

      -- ===== Search/Snap (Todo) =====
      { "<leader>s", group = "search/snap" },
      { "<leader>sf", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
      { "<leader>st", "<cmd>Trouble todo<cr>", desc = "Show todos" },
      {
        "<leader>sn",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Snap next todo",
      },
      {
        "<leader>sp",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Snap prev todo",
      },

      -- ===== Explorer/Edit =====
      { "<leader>e", group = "explorer" },
      { "<leader>ee", "<cmd>Neotree filesystem reveal focus<cr>", desc = "Reveal focus" },
      { "<leader>ef", "<cmd>Neotree filesystem float<cr>", desc = "Float" },
      { "<leader>et", "<cmd>Neotree toggle<cr>", desc = "Toggle" },
      { "<leader>eh", "<cmd>Neotree filesystem left<cr>", desc = "Left side" },
      { "<leader>ed", "<cmd>Neotree document_symbols left<cr>", desc = "Symbols" },
      { "<leader>eb", "<cmd>Neotree buffers reveal left<cr>", desc = "Buffers" },
      { "<leader>es", "<cmd>Neotree show<cr>", desc = "Show" },

      -- ===== Buffer =====
      { "<leader>b", group = "buffer" },
      { "<leader>bx", "<cmd>BufferLinePickClose<cr>", desc = "Pick close" },
      { "<leader>bX", "<cmd>BufferLineCloseOthers<cr>", desc = "Close others" },
      { "<leader>bs", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory" },

      -- ===== Aerial (Symbols) =====
      { "<leader>a", group = "aerial" },
      { "<leader>ao", "<cmd>AerialOpen<cr>", desc = "Open" },
      { "<leader>at", "<cmd>AerialToggle<cr>", desc = "Toggle" },
      { "<leader>ad", "<cmd>AerialGoToSymbol<cr>", desc = "Go to symbol" },
      {
        "<leader>ae",
        "<cmd>AerialToggle<cr><cmd>Neotree toggle<cr>",
        desc = "Toggle with neo-tree",
      },

      -- ===== Terminal =====
      { "<leader>t", group = "terminal" },
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Float" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=40 1<cr>", desc = "Vertical" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal size=10 2<cr>", desc = "Horizontal" },
      { "<leader>tn", "<cmd>ToggleTerm direction=tab 3<cr>", desc = "Tab" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float 4<cr>", desc = "Float (4)" },

      -- ===== Run (Overseer) =====
      { "<leader>r", group = "run" },
      { "<leader>rr", "<cmd>OverseerRun<cr>", desc = "Run task" },
      { "<leader>rt", "<cmd>OverseerToggle<cr>", desc = "Toggle" },
      { "<leader>ro", "<cmd>OverseerOpen<cr>", desc = "Open Overseer Menu" },

      -- ===== Memo (Telekasten) =====
      { "<leader>m", group = "memo" },
      { "<leader>mm", "<cmd>Telekasten panel<cr>", desc = "Panel" },
      { "<leader>mf", "<cmd>Telekasten find_notes<cr>", desc = "Find notes" },
      { "<leader>mg", "<cmd>Telekasten search_notes<cr>", desc = "Search notes" },
      { "<leader>md", "<cmd>Telekasten goto_today<cr>", desc = "Go to today" },
      { "<leader>mz", "<cmd>Telekasten follow_link<cr>", desc = "Follow link" },
      { "<leader>mn", "<cmd>Telekasten new_note<cr>", desc = "New note" },
      { "<leader>mc", "<cmd>Telekasten show_calendar<cr>", desc = "Show calendar" },
      { "<leader>mb", "<cmd>Telekasten show_backlinks<cr>", desc = "Show backlinks" },
      { "<leader>mI", "<cmd>Telekasten insert_img_link<cr>", desc = "Insert image link" },
      { "<leader>ml", "<cmd>Telekasten insert_link<cr>", desc = "Insert link", mode = "i" },

      -- ===== Zen =====
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },

      -- ===== LSP =====
      { "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },

      -- ===== Preview =====
      { "<leader>p", group = "preview" },
      { "<leader>pm", "<cmd>RenderMarkdown toggle<cr>", desc = "Markdown" },

      -- ===== Vibe (AI) =====
      { "<leader>v", group = "vibe" },
      { "<leader>vm", "<cmd>lua _mistral_vibe()<cr>", desc = "Mistral" },
      { "<leader>vg", "<cmd>lua _gemini_cli()<cr>", desc = "Gemini" },
      { "<leader>vc", "<cmd>lua _copilot_cli()<cr>", desc = "Copilot CLI" },

      -- ===== Orgmode =====
      { "<leader>o", group = "orgmode" },
      { "<leader>oa", "<cmd>Org agenda<cr>", desc = "Org agenda" },
      { "<leader>oc", "<cmd>Org capture<cr>", desc = "Org capture" },

      -- ===== Standalone =====
      { "<leader>l", group = "lazy tools" },
      { "<leader>lg", "<cmd>lua _lazygit_toggle()<cr>", desc = "LazyGit" },
      { "<leader>ld", "<cmd>lua _lazydocker_toggle()<cr>", desc = "LazyDocker" },
      { "<leader>lb", "<cmd>lua _gobang_toggle()<cr>", desc = "GoBang" },

      -- ===== Git ===
      { "<leader>h", group = "git" },
      { "<leader>hn", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
      { "<leader>hp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
      { "<leader>ha", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
      { "<leader>hx", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
      { "<leader>hb", "<cmd>Gitsigns blame<cr>", desc = "Blame" },
      { "<leader>hh", "<cmd>DiffviewOpen HEAD~1<CR>", desc = "Diff (~)"},
      { "<leader>hf", "<cmd>DiffviewFileHistory %<CR>", desc = "Diff History"},
      { "<leader>hc", "<cmd>DiffviewClose<CR>", desc = "Close Diff View"},
      { "<leader>hd", "<cmd>Diffview<CR>", desc = "Open Diff View"},

      -- ===== GitHub =====
      { "<leader>g", group = "GitHub" },
      { "<leader>gi", "<CMD>Octo issue list<CR>", desc = "List GitHub Issues", },
      { "<leader>gp", "<CMD>Octo pr list<CR>", desc = "List GitHub PullRequests", },
      { "<leader>gd", "<CMD>Octo discussion list<CR>", desc = "List GitHub Discussions", },
      { "<leader>gn", "<CMD>Octo notification list<CR>", desc = "List GitHub Notifications", },
    })
  end,
}
