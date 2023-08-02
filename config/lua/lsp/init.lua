-- Set up handlers
require("lsp.handlers").setup()

-- Formatters and linters
require("lsp.null-ls") -- Must be loaded after mason-null-ls

-- LSP config
require("lsp.lspconfig") -- Always load lspconfig at the end
