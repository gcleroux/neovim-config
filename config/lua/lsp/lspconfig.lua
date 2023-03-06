local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- Use share on_attach/capabilities from handlers file
local on_attach = require("lsp.handlers").on_attach
local capabilities = require("lsp.handlers").capabilities
local LSP = require("lsp.servers")

for _, server in ipairs(LSP.servers) do
    if LSP[server] then
        -- Specific LSP config
        lspconfig[server].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = LSP[server],
        })
    else
        -- Default config
        lspconfig[server].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end
end
