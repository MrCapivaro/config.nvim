return {
  -- Needed for some parts of Zen Mode
  -- {
  --   "folke/twilight.nvim",
  --   event = "BufReadPost",
  --   opts = {},
  -- },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {},
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" }
    },
  },
}
