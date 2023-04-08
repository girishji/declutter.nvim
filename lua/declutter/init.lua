local M = {}

M.options = {
  -- theme = 'light', -- dark/light
}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

local load = function(theme)
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
end

return M
