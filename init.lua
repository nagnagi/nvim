vim.loader.enable()

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- plugin settings
require("config.lazy")
-- user settings
require("user.init")
