local M = {}

M.options = {
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
  -- require('declutter.treesitter').markdown_hl_fenced_code_block()
end

local comments_in_bright_color = true
vim.api.nvim_create_user_command('DCToggleBrightComments', function()
  local c = require('declutter.theme').get_colors()
  vim.api.nvim_set_hl(0, 'Comment', {
    ctermfg = comments_in_bright_color and
        c.cyan or c.br_cyan,
    cterm = { italic = true }
  })
  comments_in_bright_color = not comments_in_bright_color
end, {})

return M
