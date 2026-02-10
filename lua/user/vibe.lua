function _mistral_vibe()
  vim.cmd("botright vertical terminal vibe", { hide = true })
  vim.cmd("vertical resize 60", { hide = true })
end

vim.api.nvim_create_user_command("VibeMistralVibe", _mistral_vibe, {})
vim.api.nvim_set_keymap("n", "<leader>vm", "<cmd>lua _mistral_vibe()<CR>", {noremap = true, silent = true})

function _gemini_cli()
  vim.cmd("botright vertical terminal gemini", { hide = true })
  vim.cmd("vertical resize 60", { hide = true })
end

vim.api.nvim_create_user_command("VibeGeminiCLI", _gemini_cli, {})
vim.api.nvim_set_keymap("n", "<leader>vg", "<cmd>lua _gemini_cli()<CR>", {noremap = true, silent = true})

function _copilot_cli()
  vim.cmd("botright vertical terminal copilot", { hide = true })
  vim.cmd("vertical resize 60", { hide = true })
end

vim.api.nvim_create_user_command("VibeCopilotCLI", _copilot_cli, {})
vim.api.nvim_set_keymap("n", "<leader>vc", "<cmd>lua _copilot_cli()<CR>", {noremap = true, silent = true})

