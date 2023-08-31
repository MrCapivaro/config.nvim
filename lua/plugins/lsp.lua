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

      require("mason-lspconfig").setup({
        ensure_installed = {
          "html",
          "cssls",
          "emmet_ls",
          "clangd",
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
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      return {
        root_dir = require("null-ls.utils").root_pattern(
          ".null-ls-root",
          "MakeFile",
          ".git",
          ".stylua.toml"
        ),
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          -- null_ls.builtins.formatting.prettier.with({
          --   env = {
          --     PRETTIER_DEFAULT_CONFIG = vim.fn.expand(vim.fn.stdpath("config") ..
          --       "/lua/extras/config/formatters/.prettierrc"),
          --   },
          -- }),
          null_ls.builtins.formatting.clang_format.with({
            filetypes = { "c", "cpp", "cs", "java" },
          }),
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = bufnr,
                  -- filter = function(_client)
                  --   return _client.name == "null-ls"
                  -- end,
                })
              end
            })
          end
        end,
      }
    end,
  },
}
