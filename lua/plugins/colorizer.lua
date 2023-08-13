return {
  "norcalli/nvim-colorizer.lua",
  event = "VeryLazy",
  ft = { "css", "javascript", "typescript", "jsx" },
  opts = {
    css = true,
    css_fn = true,
  },
  config = function(_, opts)
    require("colorizer").setup({
      "css",
      "html",
      "javascript",
      "typescript",
      "jsx",
    }, opts)
  end
}
