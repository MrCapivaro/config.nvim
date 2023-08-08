return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "Telescope" },
  keys = {
    {
      "<leader>f",
      "<cmd>Telescope find_files<cr>",
      desc = "Find files"
    },
  },
}
