-- Java compilation template
return {
	name = "javac build",
	builder = function ()
		local file = vim.fn.expand("%:p")
		return {
			cmd = { "javac", file },
			components = { { "on_output_quickfix", open = true }, "default" },
		}
	end,
	condition = {
		filetype = { "java" },
	},
}
