--
-- nvim_cmp.lua
-- LSPクライアント周りの設定
--

local luasnip = require("luasnip")
local cmp = require("cmp")
local lspkind = require('lspkind')
lspkind.setup({

})

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = function(callback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn.col('.') == 1 or vim.fn.getline('.'):sub(vim.fn.col('.') -1, vim.fn.col('.') -1):match('%s') then
        callback()
      else
        cmp.complete()
      end
    end,
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50
    })
  }
})

require('lspsaga').setup({
  uii = { border = 'rounded' },
  symbol_in_winbar = { enable = true },
  code_action = { enable = true },
  lightbulb = { enable = true },
})
