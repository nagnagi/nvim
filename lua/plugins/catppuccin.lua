return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function ()
    require("catppuccin").setup({
      integrations = {
        telescope = {
          enabled = true,
        }
      },
      custom_highlights = function(colors)
        return {
          TelescopeBorder = { fg = colors.blue },
          TelescopePromptBorder = { fg = colors.mauve },
          TelescopePromptNormal = { bg = "none" },
          TelescopePromptTitle = { fg = colors.mauve, bg = "none" }, -- 背景を消す
          TelescopePreviewTitle = { fg = colors.green, bg = "none" }, -- 背景を消す
          TelescopeResultsTitle = { fg = colors.blue, bg = "none" },  -- 背景を消す
        }
      end
    })
  end
}
