return {
	  "mason-org/mason-lspconfig.nvim",
	  version = "*",
	  lazy = false,
	  config = function()
	    local lsp_servers = { "lua_ls", "pyright", "ruff", "ts_ls", "html", "yamlls", "jsonls" }
	    local diagnostics = { "typos_lsp" }
	    require("mason-lspconfig").setup {
	      ensure_installed = vim.iter({ lsp_servers, diagnostics }):flatten():totable(),
	    }
      -- ホバーの無効化
      -- vim.api.nvim_create_autocmd("CursorHold", {
      --     group = vim.api.nvim_create_augroup("LspAutoHover", { clear = true }),
      --     -- autocmd を特定のファイルタイプに限定することも可能:
      --     -- pattern = { "*.py", "*.lua", "*.ts" },
      --     callback = function()
      --         -- 現在のバッファにアクティブなLSPクライアントがある場合にのみ実行
      --         if #vim.lsp.get_clients({ bufnr = 0 }) > 0 then
      --             vim.diagnostic.open_float(nil, {scope = "line"})
      --         end
      --     end,
      -- })

      -- 挿入モードに入ったときにLSPポップアップを閉じる (UX改善)
      vim.api.nvim_create_autocmd("ModeChanged", {
          group = vim.api.nvim_create_augroup("LspPopupClose", { clear = true }),
          pattern = "n:i", -- ノーマルモードから挿入モードへ変更した時
          callback = function()
              vim.cmd("pclose") -- プレビューウィンドウ（LSPのポップアップも含む）を閉じる
          end,
      })

	    -- カーソル下の変数の情報
	    vim.keymap.set('n', 'K', function ()
	      vim.lsp.buf.hover()
	    end, {
        desc="Open information"
      })
	    vim.keymap.set('n', '<leader>k', function ()
	      vim.diagnostic.open_float(nil, {scope = "line"})
	    end, { desc="Open diagnostic" })
	    -- 定義ジャンプ
      vim.keymap.set('n', 'gd', function ()
        vim.lsp.buf.definition()
      end, { desc="Goto definition" })
	    -- 定義ジャンプ後に下のファイルに戻る
	    vim.keymap.set('n', 'gt', '<C-t>', {
        desc="Previous tag stack"
      })
	    -- 改行やインデントなどのフォーマット
      -- vim.keymap.set('n', 'gf', function ()
      --   vim.lsp.buf.format()
      -- end, { desc="Format" })
	    -- カーソル下の変数をコード内で参照している箇所
      vim.keymap.set('n', 'gr', function ()
        vim.lsp.buf.references()
      end, { desc="Reference variable" })
	    -- 変数名のリネーム
      vim.keymap.set('n', 'gn', function ()
        vim.lsp.buf.rename()
      end, { desc="Rename variable" })
    end,
    }
