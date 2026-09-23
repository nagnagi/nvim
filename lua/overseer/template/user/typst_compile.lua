-- Typst compilation template
return {
	name = "typst compile",
	builder = function ()
		local file = vim.fn.expand("%:p")
		local output_pdf = vim.fn.expand("%:p:r") .. ".pdf"
		return {
			cmd = { "typst", "compile", file, output_pdf },
			components = { { "on_output_quickfix", open = true }, "default" },
		}
	end,
	condition = {
		filetype = { "typst" },
	},
}
