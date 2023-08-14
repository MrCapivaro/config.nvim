return {
  "nvim-neorg/neorg",
  ft = "norg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    load = {
      -- Core dependencies and pretty icons
      ["core.defaults"] = {},
      ["core.concealer"] = {
        config = {
          icon_preset = "diamond",
        },
      },
      -- Create and manage workspaces
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/notes",
          },
          default_workspace = "notes",
          index = "index.norg",
        },
      },
      -- Create indexes of workspaces
      ["core.summary"] = {},
    },
  },
}
