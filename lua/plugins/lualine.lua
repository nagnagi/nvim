return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function ()
		require("lualine").setup({
			options = {
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "mode" },
					function ()
						if vim.g.skk_enabled then
							if vim.fn["skkeleton#is_enabled"]() then
								return vim.fn["skkeleton#mode"]()
							end
							return "▽SKK"
						else
							return ""
						end
					end,
				},
			},
		})
	end,
}
