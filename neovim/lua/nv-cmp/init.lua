vim.o.completeopt = "menu,menuone,noselect"


local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup ({
    snippet = {
      expand = function(args)
          luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      -- ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
--      -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
--      ['<Tab>'] = cmp.mapping(function(fallback)
--        if cmp.visible() then
--          cmp.select_next_item()
--        elseif luasnip.expand_or_jumpable() then
--          luasnip.expand_or_jump()
--        else
--          fallback()
--        end
--      end, { 'i', 's' }),
--      ['<S-Tab>'] = cmp.mapping(function(fallback)
--        if cmp.visible() then
--          cmp.select_prev_item()
--        elseif luasnip.jumpable(-1) then
--          luasnip.jump(-1)
--        else
--          fallback()
--        end
--      end, { 'i', 's' }),
     },
    sources = {
      { name = 'nvim_lua', keyword_length = 2},
      { name = 'nvim_lsp', keyword_length = 3 },
      { name = 'path' },
      { name = 'treesitter' },
      { name = 'luasnip' },
      { name = 'vsnip', keyword_length = 2},
      { name = 'nvim_lsp_signature_help' },
      { name = 'buffer', keyword_length = 2 },
      { name = 'calc' },
      { name = 'spell' },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          vsnip = '[vsnip]',
          nvim_lsp_signature_help = '[nvim_lsp_signature_help]',
          buffer = '[buf]',
          nvim_lsp = '[LSP]',
          nvim_lua = '[api]',
          path = '[path]',
          luasnip = '[snip]',
          spell = '[spell]'
        }
      }
    },
    views = {
        entries = 'native'
    },
    experimental = {
      ghost_text = true,
    }
  })
--
-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--     sources = {
--         { name = 'buffer' }
--     }
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     sources = cmp.config.sources({
--       { name = 'path' }
--     }, 
--     {
--       { name = 'cmdline' }
--     })
-- })
--
-- -- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_servers = {
    'lua_ls',
    'pyright',
    'rust_analyzer',
    'ts_ls',
    'dhall_lsp_server'
}
for _, server in ipairs(lsp_servers) do
    require('lspconfig')[server].setup {
        capabilities = capabilities
    }
end
