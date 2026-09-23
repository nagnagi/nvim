-- Java execution template
return {
	name = "run Java program",
	builder = function ()
		local class_name = vim.fn.expand("%:t:r")
		return {
			cmd = { "java", class_name },
			components = { { "on_output_quickfix", open = true }, "default" },
		}
	end,
	condition = {
		filetype = { "java" },
	},
}
