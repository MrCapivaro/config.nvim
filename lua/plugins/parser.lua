return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpadateSync" },
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "org" },
    },
    indent = { enable = true },
    ensure_installed = {
      "lua",
      -- "luadoc",
      -- "luap",

      "markdown",
      "markdown_inline",
      "org",
      "norg",

      "bash",

      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",

      "python",
      "c",

      "json",
      "yaml",
      "toml",
      "ini",
    },
    incremental_selection = {
      enable = true,
      -- keymaps = {},
    },
  },
  config = function(_, opts)
    -- Don't reinstall parsers again everytime
    if type(opts.ensure_installed) == "table" then
      local added = {}
      opts.ensure_installed = vim.tbl_filter(function(lang)
        if added[lang] then
          return false
        end
        added[lang] = true
        return true
      end, opts.ensure_installed)
    end
    -- Setup Treesitter
    require("nvim-treesitter.configs").setup(opts)
  end,
}
