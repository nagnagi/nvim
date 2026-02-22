-- lazy.nvimによるプラグイン定義
return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  dependencies = {
    { 'nvim-orgmode/telescope-orgmode.nvim' },
  },
  config = function()
    -- orgmodeの初期化と基本設定
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      org_todo_keywords = {'TODO(t)', 'NEXT(n)', 'WAITING(w)', 'INPROGRESS(p)',  '|', 'DONE(d)', 'CANCELLED(c)'},
      org_startup_indented = true,
      org_todo_keyword_faces = {
        INPROGRESS = ':foreground blue :weight bold',
        WAITING = ':foreground gray :weight bold',
        NEXT = ':foreground yellow :weight bold',
      },
      org_hide_leading_stars = true,
      org_capture_templates = {
        c = {
          description = 'Capture',
          template = '* %U\n  %?\n',
        },
        t = {
          description = 'Task',
          template = '* TODO [#C] %?\n  SCHEDULED: %T\n  :PROPERTIES:\n  :CREATED:  %U\n  :END:\n',
          target = '~/orgfiles/tasks/tasks.org',
          headline = 'Inbox',
        },
        n = {
          description = 'Note',
          template = [[
* %?
  :PROPERTIES:
  :CREATED: %U
  :END:

** Abstract


** Main


]],
          target = '~/orgfiles/notes/notes.org',
        },
      },
    })
    
    -- LSPサポートの有効化
    vim.lsp.enable('org')
    
    vim.cmd("Org indent_mode")
    
    -- Load telescope-orgmode extension
    require('telescope').load_extension('orgmode')
    
    -- Org mode specific keymaps
    vim.keymap.set('n', '<leader>fo', function()
      require('telescope').extensions.orgmode.search_headings({})
    end, { desc = 'Search Org headings' })
    
    vim.keymap.set('n', '<leader>fr', function()
      require('telescope').extensions.orgmode.refile_heading()
    end, { desc = 'Refile heading' })
    
    vim.keymap.set('n', '<leader>fl', function()
      require('telescope').extensions.orgmode.insert_link()
    end, { desc = 'Insert link' })
    
    vim.keymap.set('n', '<leader>ft', function()
      require('telescope').extensions.orgmode.search_tags({ initial_sort = 'frequency' })
    end, { desc = 'Search tags by frequency' })
    
    -- TODO status cycling keymap (using orgmode Lua API)
    vim.keymap.set('n', '<leader>os', function()
      require('orgmode').action('org_mappings.todo_next_state')
    end, { desc = 'Cycle TODO status forward' })

    vim.keymap.set('n', '<leader>of', function()
      require('orgmode').action('org_mappings.toggle_checkbox')
    end, { desc = 'Org Toggle Checkbox' })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'org',
      callback = function()
        vim.fn['orgmode#hooks#todo_state_change'] = function(new_state)
          if new_state == 'INPROGRESS' then
            vim.fn['orgmode#clock#in']()
          end
        end
      end,
    })

  end,
}
