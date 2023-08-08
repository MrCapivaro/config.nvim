vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymaps = {
  n = {
    ["<leader>e"] = "<cmd>Ex<Cr>",
    ["<C-s>"] = "<cmd>w<Cr>",
    ["<Esc>"] = "<cmd>nohlsearch<Cr>",
    -- Window Quick Movement
    ["<C-l>"] = "<C-w>l",
    ["<C-h>"] = "<C-w>h",
  },
  i = {},
  v = {
    -- Move selected lines
    ["J"] = ":m '>+1<cr>gv=gv",
    ["K"] = ":m '<-2<cr>gv=gv",
  },
}

for mode, mode_values in pairs(keymaps) do
  for k, v in pairs(mode_values) do
    vim.keymap.set(mode, k, v)
  end
end
