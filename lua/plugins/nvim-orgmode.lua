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
    local orgmode   = require('orgmode')
    local telescope = require('telescope')
    
    local org_dir = '~/org'

    orgmode.setup({
      org_agenda_files = org_dir .. '/**/*',
      org_archive_location = org_dir .. '/archive/default.org',
      org_default_notes_file = org_dir .. '/refine.org',
      org_hide_leading_stars = false,
      org_log_repeat = false,
      org_startup_indented = true,
      og_startup_folded = 'content',
      org_highlight_latex_and_related = 'entities',
      org_agenda_span = 'week',
      org_edit_src_content_indentation = 2,
      org_todo_keyword_faces = {
        INPROGRESS = ':foreground blue :weight bold :slant italic',
        WAITING = ':foreground gray :weight bold',
        NEXT = ':foreground yellow :weight bold',
        CANCELLED = ':foreground gray',
      },
      org_todo_keywords = {'TODO(t)', 'NEXT(n)', 'WAITING(w)', 'INPROGRESS(p)',  '|', 'DONE(d)', 'CANCELLED(c)'},
      org_capture_templates = {
        c = {
          description = 'Capture',
          template = '* %U\n  %?\n',
        },
        t = {
          description = 'Task',
          target = org_dir .. '/agenda/task.org',
          headline = 'Inbox',
          template = '* TODO [#C] %?\n  SCHEDULED: %T\n  :PROPERTIES:\n  :CREATED:  %U\n  :END:\n',
        },
        j = {
          description = 'Journal',
          target = org_dir .. '/journal.org',
          template = "\n* %<%Y-%m-%d %A> %?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n\n** Task\n\n** Meeting\n\n** Reflection\n\n** Next\n\n",
        },
      },
    })
    
    -- LSPサポートの有効化
    vim.lsp.enable('org')
    
    vim.cmd("Org indent_mode")
    
    -- Load telescope-orgmode extension
    telescope.load_extension('orgmode')
    
    -- Org mode specific keymaps
    vim.keymap.set('n', '<leader>fo', function()
      telescope.extensions.orgmode.search_headings({})
    end, { desc = 'Search Org headings' })
    
    vim.keymap.set('n', '<leader>fr', function()
      telescope.extensions.orgmode.refile_heading()
    end, { desc = 'Refile heading' })
    
    vim.keymap.set('n', '<leader>fl', function()
      telescope.extensions.orgmode.insert_link()
    end, { desc = 'Insert link' })
    
    vim.keymap.set('n', '<leader>ft', function()
      telescope.extensions.orgmode.search_tags({ initial_sort = 'frequency' })
    end, { desc = 'Search tags by frequency' })
    
    -- TODO status cycling keymap (using orgmode Lua API)
    vim.keymap.set('n', '<leader>os', function()
      orgmode.action('org_mappings.todo_next_state')
    end, { desc = 'Cycle TODO status forward' })

    vim.keymap.set('n', '<leader>of', function()
      orgmode.action('org_mappings.toggle_checkbox')
    end, { desc = 'Org Toggle Checkbox' })

    vim.cmd[[autocmd ColorScheme * hi link @org.leading.stars MyCustomHlGroup]]

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
