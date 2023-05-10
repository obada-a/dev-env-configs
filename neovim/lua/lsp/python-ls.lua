local lsp = require('lsp')

require'lspconfig'.pyright.setup {
    on_attach = lsp.on_attach,
    cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true
            },
          },
        },
        single_file_support = true
}
