return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require('lspconfig')

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          workspace = {
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library",
              "${3rd}/plenary.nvim/lua"
            },
            checkThirdParty = false,
          },
          globals = {
            "vim",
            "describe",
            "it",
          },
          hint = {
            enable = true,
            arrayIndex = "Enable",
          },
          telemetry = {
            enable = false,
          }
        }
      }
    })
	end,
}
