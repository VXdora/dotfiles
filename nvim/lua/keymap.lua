--------------------------------------------------
---  keymap.lua
---  基本的なキーバインディングはこのファイルに記載
--------------------------------------------------

-- leader keyの設定
vim.g.mapleader = " "

-- normalモード時の設定
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<up>', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':bprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ff', 'ggvG=', { noremap = true })

-- insertモード時の設定
vim.api.nvim_set_keymap('i', 'fj', '<Esc><Esc>', { silent = true })

-- fern
vim.api.nvim_set_keymap('n', '<C-n>', ':Fern .<CR>', { noremap = true })

-- lsp
vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true })
