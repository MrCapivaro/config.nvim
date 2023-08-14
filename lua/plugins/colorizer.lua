local filetypes = {
  "css",
  "html",
  "javascript",
  "typescript",
  "jsx",
}

return {
  "norcalli/nvim-colorizer.lua",
  event = "VeryLazy",
  ft = filetypes,
  opts = {
    css = true,
    css_fn = true,
  },
  config = function(_, opts)
    require("colorizer").setup(filetypes, opts)
  end
}
