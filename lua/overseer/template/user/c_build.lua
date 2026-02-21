-- C compilation template
return {
  name = "gcc build",
  builder = function()
    local file = vim.fn.expand("%:p")
    local output_file = vim.fn.expand("%:p:r")
    return {
      cmd = { "gcc", "-o", output_file, file },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "c" },
  },
}