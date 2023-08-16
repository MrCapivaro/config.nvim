return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e",  "<cmd>Neotree float<cr>",         desc = "Filetree" },
    { "<leader>bb", "<cmd>Neotree buffers float<cr>", desc = "Float Buffers" },
  },
  opts = {},
}
