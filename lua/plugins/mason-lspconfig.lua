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
	    vim.api.nvim_create_autocmd("CursorHold", {
                group = vim.api.nvim_create_augroup("LspAutoHover", { clear = true }),
                -- autocmd を特定のファイルタイプに限定することも可能:
                -- pattern = { "*.py", "*.lua", "*.ts" },
                callback = function()
                    -- 現在のバッファにアクティブなLSPクライアントがある場合にのみ実行
                    if #vim.lsp.get_clients({ bufnr = 0 }) > 0 then
                        vim.diagnostic.open_float(nil, {scope = "line"})
                    end
                end,
            })

            -- 挿入モードに入ったときにLSPポップアップを閉じる (UX改善)
            vim.api.nvim_create_autocmd("ModeChanged", {
                group = vim.api.nvim_create_augroup("LspPopupClose", { clear = true }),
                pattern = "n:i", -- ノーマルモードから挿入モードへ変更した時
                callback = function()
                    vim.cmd("pclose") -- プレビューウィンドウ（LSPのポップアップも含む）を閉じる
                end,
            })

	    -- カーソル下の変数の情報
	    vim.keymap.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>')
	    vim.keymap.set('n', 'K', '<cmd>lua vim.diagnostic.open_float(nil, {scope = "line"})<CR>')
	    -- 定義ジャンプ
	    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
	    -- 定義ジャンプ後に下のファイルに戻る
	    vim.keymap.set('n', 'gt', '<C-t>')
	    -- 改行やインデントなどのフォーマット
	    vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	    -- カーソル下の変数をコード内で参照している箇所
	    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
	    -- 変数名のリネーム
	    vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    end,
    }
