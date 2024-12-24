local dein_dir = vim.env.HOME .. '/.config/nvim/dein.vim'

if not string.match(vim.o.runtimepath, '/dein.vim') then
  vim.o.runtimepath = dein_dir .. ',' .. vim.o.runtimepath
end

if vim.call('dein#load_state', dein_dir) == 1 then
  vim.call('dein#begin', dein_dir)

  vim.call('dein#add', 'tomasr/molokai')
  vim.call('dein#add', 'nvim-tree/nvim-web-devicons')
  vim.call('dein#add', 'nvim-lualine/lualine.nvim')
  vim.call('dein#add', 'ryanoasis/vim-devicons')
  vim.call('dein#add', 'lambdalisue/fern-renderer-devicons.vim')
  vim.call('dein#add', 'lambdalisue/fern.vim')

  vim.call('dein#add', 'lewis6991/gitsigns.nvim')
  vim.call('dein#add', 'romgrk/barbar.nvim')
  vim.call('dein#add', 'akinsho/toggleterm.nvim')

  vim.call('dein#add', 'L3MON4D3/LuaSnip')
  vim.call('dein#add', 'neovim/nvim-lspconfig')
  vim.call('dein#add', 'onsails/lspkind.nvim')
  vim.call('dein#add', 'williamboman/mason.nvim')
  vim.call('dein#add', 'williamboman/mason-lspconfig.nvim')
  vim.call('dein#add', 'hrsh7th/nvim-cmp')
  vim.call('dein#add', 'hrsh7th/cmp-nvim-lsp')
  vim.call('dein#add', 'hrsh7th/cmp-buffer')

  vim.call('dein#add', 'jose-elias-alvarez/null-ls.nvim')
  vim.call('dein#add', 'nvim-lua/plenary.nvim')

  vim.call('dein#add', 'RRethy/vim-illuminate')
  vim.call('dein#add', 'norcalli/nvim-colorizer.lua')
  vim.call('dein#add', 'petertriho/nvim-scrollbar')

  vim.call('dein#add', 'tkmpypy/chowcho.nvim')
  vim.call('dein#add', 'lambdalisue/vim-readablefold')
  vim.call('dein#add', 'mattn/vim-sonictemplate')
  vim.call('dein#add', 'ntpeters/vim-better-whitespace')
  vim.call('dein#add', 'stevearc/aerial.nvim')
  vim.call('dein#add', 'karb94/neoscroll.nvim')

  vim.call('dein#add', 'nvim-telescope/telescope.nvim')
  vim.call('dein#add', 'nvim-telescope/telescope-project.nvim')


  vim.call('dein#add', 'mfussenegger/nvim-jdtls')

  vim.call('dein#end')
  vim.call('dein#save_state')
end
