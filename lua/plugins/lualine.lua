return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
  config = function ()
    require("lualine").setup({
      options = {
        globalstatus = true
      },
      sections = {
        lualine_a = {
          { 'mode' },
          function ()
            if vim.fn["skkeleton#is_enabled"]() then
              return vim.fn["skkeleton#mode"]()
            end
            return "-"
          end
        }
      }
    })
  end
}

