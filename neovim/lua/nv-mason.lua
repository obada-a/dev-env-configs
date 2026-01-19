require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
	ensure_installed = {
		"astro",
		"clangd",
		"emmet_ls",
		"lua_ls",
        "rust_analyzer",
		"ts_ls",
		"tailwindcss",
		"eslint",
		"html",
		"cssls",
		"zls",
        "dockerls",
        "elixirls",
        "pyright"
	},
	handlers = {
		function(server)
			lspconfig[server].setup({})
		end,
		-- ["tsserver"] = function()
		-- 	lspconfig.ts_ls.setup({
		-- 		settings = {
		-- 			completions = {
		-- 				completeFunctionCalls = true,
					-- },
				-- },
			-- })
		-- end,
	},
})
