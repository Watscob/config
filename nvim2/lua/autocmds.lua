-- local nvim_autocmd = vim.api.nvim_create_autocmd
-- 
-- nvim_autocmd("Filetype", { pattern = "make", command = [[setlocal noexpandtab]] })
-- nvim_autocmd("Filetype", { pattern = "go", command = [[setlocal noexpandtab]] })
-- 
-- nvim_autocmd("BufWritePre", { patter = "*", command = [[%s/\s\+$//e]] })

vim.api.nvim_exec([[autocmd Filetype make setlocal noextandtab]], false)
vim.api.nvim_exec([[autocmd Filetype go setlocal noextandtab]], false)
