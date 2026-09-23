return {
  'vim-skk/skkeleton',
  dependences = {
    'vim-denops/denops.vim',
    'nvim-lua/plenary'
  },
  init = function ()
    vim.g.skk_enabled = false
  end,
  config = function ()
    local curl = require("plenary.curl")
    local dict_dir = vim.fn.expand("~/.skk")
    local dict_path = dict_dir .. "/SKK-JISYO.L"

    if vim.fn.filereadable(dict_path) == 0 then
      print("download SKK Dictionary...")

      if vim.fn.isdirectory(dict_dir) == 0 then
        vim.fn.mkdir(dict_dir, "p")
      end

      local response = curl.get("https://skk-dev.github.io/dict/SKK-JISYO.L.gz", {
        output = dict_path .. ".gz"
      })

      if response.exit == 0 then
        vim.fn.system({ "gunzip", dict_path .. ".gz" })
        print("download SKK Dictionary successfully!")
      else
        print("FATAL: failed to download SKK Dictionary")
      end
    end

    local function setup_skkeleton()
      vim.fn["skkeleton#config"]({
        globalDictionaries = { dict_path },
        userDictionary = dict_dir .. "/skk-jisyo.utf8",
        keepState = true,
      })

      vim.fn["skkeleton#initialize"]()

      local mapped_keys = vim.g['skkeleton#mapped_keys']
      table.insert(mapped_keys, 'v')
      vim.g['skkeleton#mapped_keys'] = mapped_keys

      vim.fn["skkeleton#register_keymap"]('input', 'v', 'henkanPoint')

      vim.fn["skkeleton#register_kanatable"]('rom', {
        ['jk'] = 'escape',
        ['j-'] = {'-'},
        ['j/'] = {'・'},
        ['j;'] = {'；'},
        ['j['] = {'【'},
        ['j]'] = {'】'},
        ['vv'] = {'v'},
        ['j.'] = {'.'},
      })

      local function enable_skk()
        vim.g.skk_enabled = true

        vim.keymap.set("c", "<C-j>", "<Plug>(skkeleton-enable)")
        vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-enable)")
        require("lualine").refresh()
      end

      local function disable_skk()
        vim.g.skk_enabled = false

        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<Plug>(skkeleton-disable)", true, false, true),
          "m", false)

        vim.keymap.del("c", "<C-j>")
        vim.keymap.del("i", "<C-j>")
        require("lualine").refresh()
      end

      vim.keymap.set("n", "<leader>xj", function ()
        if vim.g.skk_enabled then
          disable_skk()
        else
          enable_skk()
        end
      end, { desc = "Toggle SKK" })
      
      vim.api.nvim_create_autocmd("User", {
        pattern = "skkeleton-enable-pre",
        callback = function()
          require("nvim-autopairs").disable()
          require("lualine").refresh()
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "skkeleton-disable-pre",
        callback = function()
          require("nvim-autopairs").enable()
          require("lualine").refresh()
      end,
    })
    end

    vim.defer_fn(setup_skkeleton, 200)
  end
}
