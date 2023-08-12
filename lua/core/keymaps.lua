vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- File Explorer
map("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Open File Explorer" })

-- Save Buffer
map({ "n", "i", "v", "s" }, "<C-s>", "<cmd>w<cr> ", { desc = "Save" })

-- Move Lines
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Better Screen Movement
map("n", "<C-u>", "<C-u>zz", { desc = "Move Screen Up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move Screen Up" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Buffer Commands
map({ "n", "v", "s" }, "<Tab>", "<cmd>bn<cr>")
map({ "n", "v", "s" }, "L", "<cmd>bn<cr>")
map({ "n", "v", "s" }, "H", "<cmd>bp<cr>")
map({ "n", "v", "s" }, "<leader>x", "<cmd>bd<cr>")
