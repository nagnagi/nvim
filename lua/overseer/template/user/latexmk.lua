-- latexmk compilation template
return {
  name = "latex make",
  builder = function()
    local file = vim.fn.expand("%:p")
    return {
      cmd = { "latexmk" },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "tex", "latex" },
  },
}
