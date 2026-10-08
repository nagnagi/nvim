vim.api.nvim_create_user_command("Realpath", function ()
	vim.cmd('echo expand("%:p")')
end, {})

vim.api.nvim_create_user_command("RealpathCopy", function ()
	vim.cmd('let @+ = expand("%:p")')
	vim.cmd('echo expand("%:p")')
end, {})

vim.api.nvim_create_user_command("ManFullScreen", function (args)
	vim.cmd("Man " .. args.args)
	vim.cmd("wincmd o")
end, { nargs = 1 })
