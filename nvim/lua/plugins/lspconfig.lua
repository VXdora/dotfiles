require('lspconfig').pyright.setup {
}

require('lspconfig').bashls.setup {
}

require('lspconfig').html.setup {
}

require('lspconfig').cssls.setup {
}

require('lspconfig').jsonls.setup {
}

require('lspconfig').jdtls.setup {
  cmd = {
    os.getenv("HOME") .. '/.config/nvim/lsp/java/bin/jdtls'
  }
}

