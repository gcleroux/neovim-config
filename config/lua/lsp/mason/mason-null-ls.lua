local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then
    return
end

local null_ls = require("../lsp.servers").null_ls

mason_null_ls.setup({
    ensure_installed = null_ls,
})
