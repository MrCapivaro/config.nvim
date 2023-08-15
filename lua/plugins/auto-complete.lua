return {
  -- Snippets Engine
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- keys = {},
  },
  -- CMP Engine and Sources
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "nvim-autopairs",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = function()
      -- vim.api.nvim_set_hs(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()

      return {
        completion = { completeopt = "menu,menuone,noinsert,noselect" },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          -- BUG: <C-Space> doesn't work on Windows
          -- ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Cr>"] = cmp.mapping.confirm({ select = false }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "neorg" },
        }),
        -- formatting = {},
        -- experimental = {
        --   ghost_text = {
        --     hl_group = "CmpGhostText",
        --   },
        -- },
        sorting = defaults.sorting,
        -- Disable CMP in comments
        enabled = function()
          local context = require("cmp.config.context")
          if vim.api.nvim_get_mode().mode == "c" then
            return true
          else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
          end
        end,
      }
    end,
  },
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      -- Autopairs in functions and methods
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      require("nvim-autopairs").setup()
    end,
  },
}
