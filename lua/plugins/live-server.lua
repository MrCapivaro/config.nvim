return {
  "MrCapivaro/live-server.nvim",
  ft = { "html", "css", "javascript", "typescript" },
  cmd = "LiveServerStart",
  keys = {
    {
      "<A-l><A-o>",
      "<cmd>LiveServerStart<cr>",
      desc = "Open Live Server",
    },
  },
  opts = {},
}
