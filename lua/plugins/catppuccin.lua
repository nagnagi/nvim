return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function ()
		require("catppuccin").setup({
			integrations = {
				telescope = {
					enabled = true,
				},
			},
			custom_highlights = function (colors)
				-- telescopeの設定
				return {
					TelescopeBorder = { fg = colors.blue },
					TelescopePromptBorder = { fg = colors.mauve },
					TelescopePromptNormal = { bg = "none" },
					TelescopePromptTitle = { fg = colors.mauve, bg = "none" },
					TelescopePreviewTitle = { fg = colors.green, bg = "none" },
					TelescopeResultsTitle = { fg = colors.blue, bg = "none" },
					FloatBorder = { fg = colors.surface1 }
				}
			end,
		})
	end,
}
