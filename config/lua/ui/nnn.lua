local nnn_status_ok, nnn = pcall(require, "nnn")
if not nnn_status_ok then
    vim.notify("Plugin nnn is missing")
    return
end

local builtin = require("nnn").builtin

require("nnn").setup({
    explorer = {
        cmd = "nnn -o",
        width = 36,
        fullscreen = false,
    },
    auto_close = false,
    replace_netrw = "picker",
    mappings = {
        { "<C-t>", builtin.open_in_tab },
        { "<C-h>", builtin.open_in_split },
        { "<C-v>", builtin.open_in_vsplit },
        { "<C-p>", builtin.open_in_preview },
        { "<C-y>", builtin.copy_to_clipboard },
        { "<C-c>", builtin.cd_to_path },
        { "<C-e>", builtin.populate_cmdline },
    },
    windownav = {
        left = "<C-w>h",
        right = "<C-w>l",
        next = "<C-w>w",
        prev = "<C-w>W",
    },
})
