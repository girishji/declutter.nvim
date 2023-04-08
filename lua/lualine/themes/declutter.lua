local c = require("declutter.theme").colors

local M = {}

M.normal = {
  a = { ctermbg = 'NONE', ctermfg = c.primary },
  b = { ctermbg = 'NONE', ctermfg = c.primary },
  c = { ctermbg = 'NONE', ctermfg = c.fg_muted_1 },
}

-- M.insert = {
--   a = { ctermbg = 'NONE', ctermfg = c.fg_coral },
--   b = { ctermbg = 'NONE', ctermfg = c.fg_coral },
-- }
--
-- M.command = {
--   a = { ctermbg = 'NONE', ctermfg = c.fg_yellow },
--   b = { ctermbg = 'NONE', ctermfg = c.fg_yellow },
-- }
--
-- M.visual = {
--   a = { ctermbg = 'NONE', ctermfg = c.fg_purple },
--   b = { ctermbg = 'NONE', ctermfg = c.fg_purple },
-- }
--
-- M.replace = {
--   a = { ctermbg = 'NONE', ctermfg = c.fg_lime },
--   b = { ctermbg = 'NONE', ctermfg = c.fg_lime },
-- }
--
-- M.terminal = {
--   a = { ctermbg = 'NONE', ctermfg = c.fg_blue },
--   b = { ctermbg = 'NONE', ctermfg = c.fg_blue },
-- }
--
-- -- inactive when there are split windows
-- M.inactive = {
--   a = { ctermbg = 'NONE', ctermfg = c.fg_overlay3 },
--   b = { ctermbg = 'NONE', ctermfg = c.fg_overlay3 },
--   c = { ctermbg = 'NONE', ctermfg = c.fg_overlay3 },
-- }

return M
