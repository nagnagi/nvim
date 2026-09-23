return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function ()
		vim.opt.termguicolors = true
		require("bufferline").setup({})

		-- バッファの移動
		vim.keymap.set("n", "<C-l>", "<Cmd>BufferLineCycleNext<CR>", {
			desc = "次のバッファに移動",
		})
		vim.keymap.set("n", "<C-h>", "<Cmd>BufferLineCyclePrev<CR>", {
			desc = "前のバッファに移動",
		})

		-- バッファの閉じる操作
		vim.keymap.set("n", "<leader>bx", "<Cmd>BufferLinePickClose<CR>", {
			desc = "バッファを選択して閉じる",
		})
		vim.keymap.set("n", "<leader>bX", "<Cmd>BufferLineCloseOthers<CR>", {
			desc = "他のバッファをすべて閉じる",
		})

		-- バッファの並び替え
		vim.keymap.set("n", "<leader>bs", "<Cmd>BufferLineSortByDirectory<CR>", {
			desc = "ディレクトリ順にソート",
		})
	end,
}
