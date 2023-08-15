return {
  "nvim-neorg/neorg",
  ft = "norg",
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.itero"] = {},
      ["core.concealer"] = {
        config = {
          icon_preset = "diamond",
        }
      },
      ["core.dirman"] = {
        config = {
          workspaces = {
            org = "~/org"
          },
        }
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        }
      },
      ["core.summary"] = {},
    },
  },
}
