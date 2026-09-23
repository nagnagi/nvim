-- C++ execution template
return {
	name = "run C++ program",
	builder = function ()
		local output_file = vim.fn.expand("%:p:r")
		return {
			cmd = { output_file },
			components = { { "on_output_quickfix", open = true }, "default" },
		}
	end,
	condition = {
		filetype = { "cpp" },
	},
}
