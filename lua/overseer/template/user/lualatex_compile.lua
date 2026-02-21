-- LuaLaTeX compilation template
return {
  name = "lualatex compile",
  builder = function()
    local file = vim.fn.expand("%:p")
    return {
      cmd = { "lualatex", "-interaction=nonstopmode", file },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "tex", "latex" },
  },
}