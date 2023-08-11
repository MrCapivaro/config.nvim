-- clipboard
vim.opt.clipboard = "unnamedplus"
-- indentation
-- 2 asd as2 asdas 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
-- ui
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.list = true
vim.opt.showmode = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.cmdheight = 0
vim.opt.colorcolumn = "88"
-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- files
vim.opt.autowrite = true
vim.opt.swapfile = false
vim.opt.backup = false
-- misc
vim.opt.ignorecase = true
vim.opt.spelllang = { "en" }
vim.opt.scrolloff = 16
vim.opt.sidescrolloff = 8
vim.opt.updatetime = 50

vim.cmd([[colorscheme habamax]])
vim.cmd([[language en_US.UTF-8]])
