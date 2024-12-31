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
vim.api.nvim_set_keymap('n', '<leader>bc', '<cmd>BufferClose<CR>', { noremap = true })

-- insertモード時の設定
vim.api.nvim_set_keymap('i', 'fj', '<Esc><Esc>', { silent = true })

-- fern
vim.api.nvim_set_keymap('n', '<leader>n', ':Fern .<CR>', { noremap = true })

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>tt', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>tf', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>tb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>th', telescope.help_tags, { desc = 'Telescope help tags' })

-- lsp
vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true })

-- lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

