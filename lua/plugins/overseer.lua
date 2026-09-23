return {
	"stevearc/overseer.nvim",
	lazy = "verylazy",
	keys = {
		{ "<leader>rr", "<CMD>OverseerRun<CR>", desc = "Run task" },
		{ "<leader>ro", "<CMD>OverseerOpen<CR>", desc = "Toggle" },
		{ "<leader>rt", "<CMD>OverseerToggle<CR>", desc = "Open Overseer Menu" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function ()
		require("overseer").setup({
			templates = {
				"builtin",
				"user.c_build",
				"user.cpp_build",
				"user.cpp_run",
				"user.docker_build",
				"user.java_build",
				"user.java_run",
				"user.lua_run",
				"user.lualatex_compile",
				"user.python_run",
				"user.typst_compile",
			},
		})
	end,
}
