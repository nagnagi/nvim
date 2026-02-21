return {
  'vim-skk/skkeleton',
  dependences = {
    'vim-denops/denops.vim',
    'nvim-lua/plenary'
  },
  config = function ()
    local curl = require("plenary.curl")
    local dict_dir = vim.fn.expand("~/.skk")
    local dict_path = dict_dir .. "/SKK-JISYO.L"

    if vim.fn.filereadable(dict_path) == 0 then
      print("download SKK Dictionary...")

      if vim.fn.isdirectory(dict_dir) == 0 then
        vim.fn.mkdir(dict_path, "p")
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
        globalDictionaries = {'~/.skk/SKK-JISYO.L'},
        keepState = true,
      })

      vim.fn["skkeleton#initialize"]()

      local mapped_keys = vim.g['skkeleton#mapped_keys']
      table.insert(mapped_keys, 'x')
      vim.g['skkeleton#mapped_keys'] = mapped_keys

      vim.fn["skkeleton#register_keymap"]('input', 'x', 'henkanPoint')

      vim.fn["skkeleton#register_kanatable"]('rom', {
        ['jk'] = 'escape',
        ['j-'] = {'-'},
        ['j/'] = {'・'},
      })

      local opt = {}
      vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>(skkeleton-toggle)", opt)
      vim.api.nvim_set_keymap("c", "<C-k>", "<Plug>(skkeleton-toggle)", opt)
      vim.api.nvim_set_keymap("n", "<C-k>", "i<Plug>(skkeleton-enable)", opt)
      
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
