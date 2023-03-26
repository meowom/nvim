vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR>', { noremap = true, silent = true })
