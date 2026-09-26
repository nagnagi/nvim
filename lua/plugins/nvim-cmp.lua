return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	config = function ()
		local cmp = require("cmp")
		local types = require("cmp.types")
		vim.opt.completeopt = { "menu", "menuone", "noselect" }
		cmp.setup({
			enabled = function ()
				if vim.fn.exists("*skkeleton#is_enabled") == 1 then
					return vim.fn["skkeleton#is_enabled"]() ~= true
				end
				return true
			end,
			snippet = {
				expand = function (args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					border = "rounded", -- "none" | "single" | "double" | "rounded" | 8文字の配列
					winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
				}),
				documentation = cmp.config.window.bordered({
					border = "rounded",
					winhighlight = "Normal:CmpDoc,FloatBorder:FloatBorder,CursorLine:CmpPmenuSel,Search:None",
				}),
				vim.diagnostic.config({
					float = {
						border = "rounded",
					},
				})
			},
			mapping = cmp.mapping.preset.insert({
				-- <C-n>: down, <C-p>: up
				["<Tab>"] = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-l>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				-- { name = "nvim_lsp_signature_help"},
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "orgmode" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
				{ name = "skkeleton" },
			}),
			performance = {
				fetching_timeout = 2000,
			},
			experimental = {
				ghost_text = true,
			},
		})

		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89b4fa", bg = "NONE" })
	end,
}
