-- Docker build template
return {
	name = "docker build",
	builder = function ()
		local dockerfile_path = vim.fn.expand("%:p:h")
		local image_name = vim.fn.input("Docker image name: ", vim.fn.expand("%:t:r"))
		if image_name == "" then
			return nil
		end
		return {
			cmd = { "docker", "build", "-t", image_name, dockerfile_path },
			components = { { "on_output_quickfix", open = true }, "default" },
		}
	end,
	condition = {
		filetype = { "dockerfile" },
	},
}
