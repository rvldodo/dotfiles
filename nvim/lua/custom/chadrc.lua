---@type ChadrcConfig
local M = {}

-- comment
-- local custom_mappings = require "custom.mappings"

M.ui = {
  theme_toggle = {"tokyodark", "onedark"},
  theme = 'tokyodark',
  hl_override = {
    CursorLine = {
      bg = "black3",
    },
    Comment = {
      italic = true,
    },
  },
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },

  transparency = true,
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
-- M.mappings = vim.tbl_deep_extend("force", M.mappings, custom_mappings)

return M
