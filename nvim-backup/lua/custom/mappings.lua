local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    },
    -- ["<c-k>"] = { ":wincmd k<CR>", "window up" },
    -- ["<c-j>"] = { ":wincmd j<CR>", "window down" },
    -- ["<c-h>"] = { ":wincmd h<CR>", "window left" },
    -- ["<c-l>"] = { ":wincmd l<CR>", "window right" },
  },
}

return M
