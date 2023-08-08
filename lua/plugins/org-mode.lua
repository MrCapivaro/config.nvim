return {
  "nvim-neorg/neorg",
  ft = "norg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
    },
  },
}
