-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function ()
--     vim.opt.termguicolors = true
--     vim.cmd([[let &t_ut='']])
--   end
-- })

local group = vim.api.nvim_create_augroup("AutoSave", {})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = group,
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.modifiable and vim.bo.buftype == "" then
      vim.cmd("silent! write")
    end
  end,
})
