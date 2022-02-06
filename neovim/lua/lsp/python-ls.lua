local lsp = require('lsp')

require'lspconfig'.pylsp.setup {
    on_attach = lsp.on_attach
}
