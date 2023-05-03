local M = {}

M.options = {
  -- light = {
  --   bg = 15,  -- cursorline, statusline, floating window bg color
  --   fg = 100, -- line numbers
  -- },
  -- dark = {
  --   bg = 8,
  --   fg = 222,
  -- }
}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

local function load(theme)
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  -- vim.o.termguicolors = true
  vim.g.colors_name = "declutter"

  for group, hl in pairs(theme) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

function M.run()
  local theme = require('declutter.theme').setup(M.options)
  load(theme)
  require('declutter.treesitter').markdown_hl_fenced_code_block()
end

return M
