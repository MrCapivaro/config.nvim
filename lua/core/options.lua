local opts = {
  -- clipboard
  clipboard = unnamedplus,
  -- indentation
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  expandtab = true,
  smartindent = true,
  -- ui
  termguicolors = true,
  number = true,
  relativenumber = true,
  signcolumn = "yes",
  wrap = false,
  list = true,
  showmode = false,
  completeopt = "menu,menuone,noselect",
  cmdheight = 0,
  -- search
  hlsearch = true,
  incsearch = true,
  -- files
  autowrite = true,
  -- misc
  ignorecase = true,
  spelllang = { "en" },
  scrolloff = 16,
  sidescrolloff = 8,
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end

vim.cmd([[colorscheme habamax]])
vim.cmd([[language en_US.UTF-8]])
