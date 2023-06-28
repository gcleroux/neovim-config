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

local btop = fterm:new({
    ft = "btop", -- You can also override the default filetype, if you want
    cmd = "btop",
    dimensions = {
        height = 0.9,
        width = 0.9,
    },
})

local zathura = fterm:new({
    ft = "zathura", -- You can also override the default filetype, if you want
    cmd = "zathura " .. vim.fn.expand("%:p"),
    dimensions = {
        height = 0.9,
        width = 0.9,
    },
})

-- Use this to toggle btop in a floating terminal
vim.keymap.set("n", "<A-b>", function()
    btop:toggle()
end)

vim.keymap.set("n", "<A-z>", function()
    zathura:toggle()
end)
