return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local noice = require("noice")
      return {
        options = { theme = "catppuccin" },
        sections = {
          lualine_x = {
            {
              noice.api.statusline.mode.get,
              cond = noice.api.statusline.mode.has,
              color = { fg = "#ff9e64" },
            }
          }
        },
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = function()
      local bufferline = require("bufferline")
      return {
        options = {
          style_preset = { bufferline.style_preset.minimal },
          diagnostics = "nvim_lsp",
          offset = {
            {
              filetype = "neo-tree",
              text = "Neo-Tree",
              highlight = "Directory",
              text_align = "left",
            },
          },
        },
      }
    end,
  },
  --
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  -- noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    },
    -- stylua: ignore
    -- keys = {
    --   {
    --     "<S-Enter>",
    --     function() require("noice").redirect(vim.fn.getcmdline()) end,
    --     mode = "c",
    --     desc =
    --     "Redirect Cmdline"
    --   },
    --   {
    --     "<leader>snl",
    --     function() require("noice").cmd("last") end,
    --     desc =
    --     "Noice Last Message"
    --   },
    --   {
    --     "<leader>snh",
    --     function() require("noice").cmd("history") end,
    --     desc =
    --     "Noice History"
    --   },
    --   { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    --   {
    --     "<leader>snd",
    --     function() require("noice").cmd("dismiss") end,
    --     desc =
    --     "Dismiss All"
    --   },
    --   {
    --     "<c-f>",
    --     function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
    --     silent = true,
    --     expr = true,
    --     desc =
    --     "Scroll forward",
    --     mode = {
    --       "i", "n", "s" }
    --   },
    --   {
    --     "<c-b>",
    --     function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
    --     silent = true,
    --     expr = true,
    --     desc =
    --     "Scroll backward",
    --     mode = {
    --       "i", "n", "s" }
    --   },
    -- },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "▏",
      -- char = "│",
      -- show_end_of_line = true,
      filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },

  },
}
