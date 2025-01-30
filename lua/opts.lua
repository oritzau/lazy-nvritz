local opt = vim.opt
local cmd = vim.api.nvim_command

vim.o.background = "dark"
opt.syntax = "ON"
opt.termguicolors = true
vim.cmd([[highlight Normal guibg=none]])
vim.cmd([[highlight NonText guibg=none]])
vim.cmd("set signcolumn=number")

opt.number = true
opt.relativenumber = true
opt.scrolloff = 8

opt.encoding = "utf8"
opt.fileencoding = "utf8"

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

opt.shiftwidth = 0
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true

opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"

opt.updatetime = 50
opt.guicursor = ""
