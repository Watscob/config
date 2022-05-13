local keymap = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

keymap("n", "<S-Tab>", "<<", opts)
keymap("n", "<Tab>", ">>", opts)
keymap("i", "<S-Tab>", "<C-d>", opts)
