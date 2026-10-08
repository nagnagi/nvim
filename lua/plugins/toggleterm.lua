return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function ()
		require("toggleterm").setup({
			-- size can be a number or function which is passed the current terminal
			-- size = 60,
			open_mapping = [[<leader>tt]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
			hide_numbers = true, -- hide the number column in toggleterm buffers
			shade_filetypes = {},
			autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
			shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			persist_size = true,
			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			direction = "horizontal",
			close_on_exit = true, -- close the terminal window when the process exits
			clear_env = false, -- use only environmental variables from `env`, passed to jobstart()
			-- Change the default shell. Can be a string or a function returning a string
			shell = vim.o.shell,
			auto_scroll = true, -- automatically scroll to the bottom on terminal output
			-- This field is only relevant if direction is set to 'float'
			float_opts = {
				border = "curved",
				winblend = 3,
				title_pos = "center",
			},
			winbar = {
				enabled = false,
				name_formatter = function (term) --  term: Terminal
					return term.name
				end,
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal

		vim.keymap.set("n", "<leader>tt", function ()
			vim.cmd(vim.v.count1 .. "ToggleTerm")
		end, { noremap = true, silent = true, desc = "Toggle" })
		vim.keymap.set("n", "<leader>tv", function ()
			vim.cmd(vim.v.count1 .. "ToggleTerm direction=vertical size=40")
		end, { noremap = true, silent = true, desc = "Vertical" })
		vim.keymap.set("n", "<leader>ts", function ()
			vim.cmd(vim.v.count1 .. "ToggleTerm direction=horizontal size=10")
		end, { noremap = true, silent = true, desc = "Horizontal" })
		vim.keymap.set("n", "<leader>tc", function ()
			vim.cmd(vim.v.count1 .. "ToggleTerm direction=tab")
		end, { noremap = true, silent = true, desc = "Tab" })
		vim.keymap.set("n", "<leader>tf", function ()
			vim.cmd(vim.v.count1 .. "ToggleTerm direction=float")
		end, { noremap = true, silent = true, desc = "Float" })

		function _G.set_terminal_keymaps ()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		-- lazygit
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
		})

		local function lazygit_toggle ()
			lazygit:toggle()
		end

		vim.keymap.set("n", "<leader>lg", lazygit_toggle, {
			noremap = true,
			silent = true,
			desc = "LazyGit",
		})

		-- lazygit
		local lazydocker = Terminal:new({
			cmd = "lazydocker",
			hidden = true,
			direction = "float",
		})

		local function lazydocker_toggle ()
			lazydocker:toggle()
		end

		vim.keymap.set("n", "<leader>ld", lazydocker_toggle, {
			noremap = true,
			silent = true,
			desc = "LazyDocker",
		})

		-- lazygit
		local gobang = Terminal:new({
			cmd = "gobang",
			hidden = true,
			direction = "float",
		})

		local function gobang_toggle ()
			gobang:toggle()
		end

		vim.keymap.set("n", "<leader>lb", gobang_toggle, {
			noremap = true,
			silent = true,
			desc = "GoBang",
		})

		-- lazysql
		local lazysql = Terminal:new({
			cmd = "lazysql",
			hidden = true,
			direction = "float",
		})

		local function lazysql_toggle ()
			lazysql:toggle()
		end

		vim.keymap.set("n", "<leader>ls", lazysql_toggle, {
			noremap = true,
			silent = true,
			desc = "LazySQL",
		})

		-- gh dash
		local gh_dash = Terminal:new({
			cmd = "gh dash",
			hidden = true,
			direction = "float",
		})

		local function gh_dash_toggle ()
			gh_dash:toggle()
		end

		vim.keymap.set("n", "<leader>lh", gh_dash_toggle, {
			noremap = true,
			silent = true,
			desc = "gh dash",
		})

		local claude_code = Terminal:new({
			cmd = "claude",
			count = 10,
			hidden = true,
			direction = "vertical",
		})

		local function claude_code_toggle ()
			claude_code:toggle(80, "vertical")
		end

		vim.keymap.set("n", "<leader>vc", claude_code_toggle, {
			noremap = true,
			silent = true,
			desc = "Open claude code",
		})

		local mistral_vibe = Terminal:new({
			cmd = "vibe",
			count = 11,
			hidden = true,
			direction = "vertical",
		})

		local function mistral_vibe_toggle ()
			mistral_vibe:toggle(80, "vertical")
		end

		vim.keymap.set("n", "<leader>vm", mistral_vibe_toggle, {
			noremap = true,
			silent = true,
			desc = "Open vibe",
		})
	end,
}
