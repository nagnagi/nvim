-- lazy.nvimによるプラグイン定義
return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- orgmodeの初期化と基本設定
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      org_todo_keywords = {'TODO(t)', 'NEXT(n)', 'WAITING(w)', '|', 'DONE(d)', 'CANCELLED(c)'},
      org_todo_keyword_faces = {
        WAITING = ':foreground blue :weight bold',
        NEXT = ':foreground yellow :weight bold',
      },
      org_hide_leading_stars = true,
      org_indent_mode = 'indent',
    })
    
    -- LSPサポートの有効化
    vim.lsp.enable('org')
  end,
}
