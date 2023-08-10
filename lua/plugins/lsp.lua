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
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neodev.nvim",                lazy = true, opts = {} },
      { "mason-lspconfig.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_defaults = lspconfig.util.default_config

      lsp_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }
          local map = vim.keymap.set
          map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          map({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
          map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
          map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
          map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
        end
      })

      -- TODO: Implement a ensure_installed function that accepts standalone
      -- formatters and lintes, like stylua
      require("mason-lspconfig").setup({
        ensure_installed = {
          "html",
          "cssls",
          "emmet_ls",
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({})
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              settings = {
                Lua = {
                  workspace = { checkThirdParty = false },
                },
              },
            })
          end,
        },
      })
    end,
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
          null_ls.builtins.formatting.prettierd,
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
}
