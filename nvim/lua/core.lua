local set = vim.opt
local api = vim.api
local cmd = vim.cmd

cmd('filetype off')
cmd('filetype indent on')

set.number = true

set.autoread = true
set.autowrite = true
set.swapfile = false

set.splitbelow = true
set.splitright = true
set.laststatus = 2
set.scrolloff = 10

set.visualbell = true

set.completeopt = 'longest,menuone'

set.updatetime = 500
set.backspace = 'eol,indent,start'
set.showcmd = true
set.showmode = true

set.expandtab = true
set.shiftwidth = 4
set.softtabstop = 4
set.autoindent = true
set.smartindent = true
set.smarttab = true
set.breakindent = true
api.nvim_create_autocmd("Filetype", { pattern = "make", command = [[setlocal noexpandtab]] })
api.nvim_create_autocmd("Filetype", { pattern = "go", command = [[setlocal noexpandtab]] })
api.nvim_set_keymap("n", "<S-Tab>", "<<", { silent = true, noremap = true })
api.nvim_set_keymap("n", "<Tab>", ">>", { silent = true, noremap = true })
api.nvim_set_keymap("i", "<S-Tab>", "<C-d>", { silent = true, noremap = true })

api.nvim_create_autocmd("BufWritePre", { pattern = "*", command = [[%s/\s\+$//e]] })

set.hlsearch = false
set.ignorecase = true
set.incsearch = true
set.smartcase = true
set.history = 1000

set.encoding = 'UTF-8'
set.cursorline = true


