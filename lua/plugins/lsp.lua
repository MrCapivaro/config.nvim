return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
    },
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
        "html",
        "cssls",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { { "mason.nvim" }, { "nvim-lua/plenary.nvim" } },
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
        },
        on_attach = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neodev.nvim",   lazy = true, opts = {} },
      { "mason.nvim" },
      { "mason-lspconfig.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local get_servers = require("mason-lspconfig").get_installed_servers

      for _, server in ipairs(get_servers()) do
        lspconfig[server].setup({ capabilities = lsp_capabilities })
      end

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
          },
        },
      })
    end,
  },
}
