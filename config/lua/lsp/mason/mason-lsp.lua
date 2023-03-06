local mason_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_status_ok then
    return
end

local servers = require("../lsp.servers").servers

mason_lsp.setup({
    ensure_installed = servers,
})
