return {
  'voldikss/vim-translator',
  version = "*",
  config = function ()
    -- no configuration
    vim.api.nvim_set_keymap("v", "<leader>t", "<cmd>'<,'>TranslateW --target_lang=ja<cr>", {noremap = true, silent = true})
  end
}

