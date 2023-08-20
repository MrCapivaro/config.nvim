if vim.g.vscode then
  require("core.keymaps")
  require("core.options")
else
  require("core.keymaps")
  require("core.options")
  require("extras.lazy")
end
