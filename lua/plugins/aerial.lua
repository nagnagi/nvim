return {
  'stevearc/aerial.nvim',
  opts = {},
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('aerial').setup({
      layout = {
        max_width = { 40, 0.2 },
        width = 30,
        min_width = 10,
        default_direction = "left",
        placement = "window",
        resize_to_content = false,
      },
      filter_kind = {
        "Class",
        "Constant",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
        "Type",
        "String",
        "Namespace",
      },
      keymaps = {
        ["?"] = "actions.show_help",
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.jump",
        ["<2-LeftMouse>"] = "actions.jump",
        ["<C-v>"] = "actions.jump_vsplit",
        ["<C-s>"] = "actions.jump_split",
        ["p"] = "actions.scroll",
        ["<C-j>"] = "actions.down_and_scroll",
        ["<C-k>"] = "actions.up_and_scroll",
        ["{"] = "actions.prev",
        ["}"] = "actions.next",
        ["[["] = "actions.prev_up",
        ["]]"] = "actions.next_up",
        ["q"] = "actions.close",
      },
      update_on_insert = true,
    })

    vim.keymap.set('n', '<leader>aa', '<cmd>AerialOpen<CR>', { desc = 'Aerial open' })
    vim.keymap.set('n', '<leader>at', '<cmd>AerialToggle<CR>', { desc = 'Aerial toggle' })

    -- neo-tree と aerial を一緒にトグル
    vim.keymap.set('n', '<leader>ae', '<cmd>AerialToggle<CR><cmd>Neotree toggle<CR>', { desc = 'Toggle neo-tree and aerial' })
  end,
}
