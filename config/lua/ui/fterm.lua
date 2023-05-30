local fterm_status_ok, fterm = pcall(require, "FTerm")
if not fterm_status_ok then
    vim.notify("Plugin fterm is missing")
    return
end

fterm.setup({
    border = "double",
    dimensions = {
        height = 0.9,
        width = 0.9,
    },
})
