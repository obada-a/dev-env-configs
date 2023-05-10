local lsp = require('lsp')

require'lspconfig'.rust_analyzer.setup{
    on_attach = lsp.on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enabled = true
            },
            checkOnSave = {
                command = "clippy",
            }
        }
    }
}
