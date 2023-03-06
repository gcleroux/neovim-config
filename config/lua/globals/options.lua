local o = vim.o
-- local wo = vim.wo
-- local bo = vim.bo

-- Set the leader key to spacebar
vim.g.mapleader = " "

-- Disabling netrw at init (strong advised by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Global options
o.relativenumber = true
o.clipboard = "unnamedplus"
o.cmdheight = 2
o.fileencoding = "utf-8"
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 6
o.mouse = "a"
o.smartindent = true
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.number = true
o.numberwidth = 4
o.cursorline = true
o.termguicolors = true
o.showmode = false
o.foldcolumn = "0"
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

-- Window local options

-- Buffer local options
