require("telescope").setup({
  defaults = {
    sorting_strategy = "ascending",
    winblend = 4
  }
})

local telescope = require("telescope.builtin")
vim.keymap.set('n', '<C-s>', telescope.live_grep, { desc = 'Telescope live grep' })
