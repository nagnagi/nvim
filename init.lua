vim.loader.enable()

-- リーダーキーとローカルリーダーキーを明示的にバックスラッシュに設定
-- (デフォルトと同じですが、意図を明確にするために記述します)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("config.lazy")

vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.o.updatetime = 500
-- vim.cmd("colorscheme onedark")
vim.cmd("colorscheme catppuccin-mocha")

require("user.ikeymap")
require("user.layout")
require("user.vibe")

