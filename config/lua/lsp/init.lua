-- Set up mason first
require("lsp.mason.mason")

-- Set up handlers
require("lsp.handlers").setup()

-- Formatters and linters
require("lsp.mason.mason-null-ls")
require("lsp.null-ls") -- Must be loaded after mason-null-ls

-- LSP config
require("lsp.mason.mason-lsp")
require("lsp.lspconfig") -- Always load lspconfig at the end
