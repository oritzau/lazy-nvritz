local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch-stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("keys")
vim.g.mapleader = "<space>"
-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("lazy").setup("plugins")
require("opts")
