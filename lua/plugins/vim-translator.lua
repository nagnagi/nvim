return {
	"voldikss/vim-translator",
	version = "*",
	config = function ()
		-- no configuration
		vim.keymap.set("v", "<leader>t", "<cmd>'<,'>TranslateW --target_lang=ja<cr>", { noremap = true, silent = true })
	end,
}
