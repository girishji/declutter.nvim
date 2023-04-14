-- Help:
--   :hi {groupname}
--
-- https://jeffkreeftmeijer.com/vim-16-color/
-- https://vimdoc.sourceforge.net/htmldoc/syntax.html
-- https://github.com/cideM/yui
--
-- NOTE: It is possible to reclaim 3 more colors for syntax highlighting.
--   bg_red/yellow/green are linked to bright_r/y/g. Instead of using these
--   as bg colors for error/warning/hint you can only use foreground colors
--   for these groups, and keep default bg color.


local M = {}

M.colors = {
  fg_muted_1 = 0,    -- black: LineNr
  fg_muted_2 = 8,    -- bright black
  bg_muted_1 = 7,    -- overlay for ui elemeents
  bg_muted_2 = 15,   -- proxy for bg, cursorline
  primary = 5,       -- magenta
  bg_primary = 13,   -- bright magenta
  secondary = 6,     -- cyan
  bg_secondary = 14, -- bringt cyan (Operator)
  red = 1,
  green = 2,
  yellow = 3,
  blue = 4,
  bg_red = 9, -- bright red
  bg_green = 10,
  bg_yellow = 11,
  bg_blue = 12,
}

function M.setup(opts)
  local c = M.colors

  local highlights = {
    -- VIM UI
    -- https://vimdoc.sourceforge.net/htmldoc/syntax.html
    --
    -- By not setting Normal and NormalNC we get bg and fg set by Terminal, including transparent bg.
    -- Consequently, we cannot determine fg and bg color without querying the terminal.
    --   Substitute 'bold cyan' as proxy for bg color
    -- Normal = for Normal mindowns, NormalNC = for non current windows
    Cursor                   = { ctermbg = c.primary },
    CursorLine               = { ctermbg = c.bg_muted_2, cterm = {} },
    MatchParen               = { ctermbg = c.bg_blue },
    ColorColumn              = { ctermbg = c.bg_muted_1 },
    SpellBad                 = { ctermbg = c.bg_red },
    SpellCap                 = { ctermbg = c.bg_green },
    SpellRare                = { ctermbg = c.bg_yellow },
    SpellLocal               = { ctermbg = c.bg_blue },
    NonText                  = { ctermfg = c.fg_muted_1 },
    LineNr                   = { ctermfg = c.fg_muted_1 },
    CursorLineNr             = { ctermbg = c.bg_muted_2, cterm = {} },
    Visual                   = { ctermbg = c.bg_primary },
    IncSearch                = { ctermfg = c.primary, cterm = { reverse = true } },
    Search                   = { ctermfg = c.primary, ctermbg = c.fg_muted_1 },
    StatusLine               = { ctermbg = c.bg_muted_1 },
    StatusLineNC             = { ctermbg = 'NONE' },
    TabLine                  = { ctermbg = c.bg_muted_1 },
    TabLineSel               = { ctermbg = c.bg_muted_2 },
    Folded                   = { ctermfg = c.primary, cterm = { bold = true } },
    Conceal                  = { ctermfg = c.primary },
    Directory                = { ctermfg = c.bg_blue },
    Title                    = { ctermfg = c.primary, cterm = { bold = true } },
    ErrorMsg                 = { link = 'DiffDelete' }, -- error messages on the command line
    WarningMsg               = { link = 'DiffChange' },
    MoreMsg                  = { link = 'Title' },      -- 'show more' prompt
    ModeMsg                  = { link = 'MoreMsg' },    -- 'showmode' message (e.g., "-- INSERT --")
    CursorColumn             = { link = 'CursorLine' },
    SignColumn               = { link = 'LineNr' },
    WildMenu                 = { link = 'Visual' },
    FoldColumn               = { link = 'SignColumn' },
    Question                 = { link = 'MoreMsg' },
    TabLineFill              = { link = 'StatusLineNC' },
    SpecialKey               = { link = 'NonText' },
    --
    -- nvim -d (vimdiff)
    DiffAdd                  = { ctermbg = c.bg_green },
    DiffChange               = { ctermbg = c.bg_yellow },
    DiffDelete               = { ctermbg = c.bg_red },
    DiffText                 = { ctermbg = c.bg_primary },
    --
    -- Floating Windows
    FloatBorder              = { ctermfg = 'NONE', ctermbg = c.bg_muted_1 },
    NormalFloat              = { ctermfg = 'NONE', ctermbg = c.bg_muted_1 }, -- Normal text in floating windows.
    -- FloatTitle               = { cterm = { bold = true } },
    -- NormalSB            = { ctermfg = c.fg_sidebar, ctermbg = c.bg_sidebar }, -- normal text in sidebar
    --
    WinSeparator             = { link = 'FloatBorder' },
    --
    Pmenu                    = { link = 'NormalFloat' },
    PmenuSel                 = { link = 'Visual' },
    PmenuSBar                = { link = 'Visual' },        -- scrollbar
    PmenuThumb               = { ctermbg = c.fg_muted_1 }, -- thumb of scrollbar
    --
    -- Generic syntax
    -- https://vimdoc.sourceforge.net/htmldoc/syntax.html
    --    *Comment	any comment
    Comment                  = { ctermfg = c.fg_muted_2, cterm = { italic = true } },
    --
    -- *Constant	any constant
    --  String		a string constant: "this is a string"
    --  Character	a character constant: 'c', '\n'
    --  Number		a number constant: 234, 0xff
    --  Boolean	a boolean constant: TRUE, false
    --  Float		a floating point constant: 2.3e10
    Constant                 = { ctermfg = 'NONE' },
    String                   = { ctermfg = 'NONE', cterm = { italic = true } },
    --
    -- *Identifier	any variable name
    --  Function	function name (also: methods for classes)
    Identifier               = { ctermfg = 'NONE' },
    --
    -- *Statement	any statement
    --  Conditional	if, then, else, endif, switch, etc.
    --  Repeat		for, do, while, etc.
    --  Label		case, default, etc.
    --  Operator	"sizeof", "+", "*", etc.
    --  Keyword	any other keyword (class, return, etc.)
    --  Exception	try, catch, throw
    Statement                = { ctermfg = 'NONE' },
    -- Keyword                  = { ctermfg = 'NONE', cterm = { bold = true } },
    -- Exception                = { link = 'Keyword' },
    -- Conditional              = { link = 'Keyword' },
    -- Repeat                   = { link = 'Keyword' },
    -- Label                    = { link = 'Keyword' },
    Operator                 = { link = 'Delimiter' },
    --
    -- *PreProc	generic Preprocessor
    --  Include	preprocessor #include
    --  Define		preprocessor #define
    --  Macro		same as Define
    --  PreCondit	preprocessor #if, #else, #endif, etc.
    PreProc                  = { ctermfg = 'NONE', cterm = { italic = true } },
    --
    -- *Type		int, long, char, etc.
    --  StorageClass	static, register, volatile, etc.
    --  Structure	struct, union, enum, etc.
    --  Typedef	A typedef
    Type                     = { ctermfg = 'NONE' },
    StorageClass             = { ctermfg = 'NONE', cterm = { italic = true } },
    -- Structure                = { ctermfg = 'NONE', cterm = { italic = true } },
    Typedef                  = { ctermfg = 'NONE', cterm = { italic = true } },
    --
    -- *Special	any special symbol
    --  SpecialChar	special character in a constant
    --  Tag		you can use CTRL-] on this
    --  Delimiter	character that needs attention
    --  SpecialComment	special things inside a comment
    --  Debug		debugging statements
    Special                  = { ctermfg = 'NONE' },
    Delimiter                = { ctermfg = c.bg_secondary, cterm = {} }, -- operator symbols
    --
    -- *Underlined	text that stands out, HTML links
    Underlined               = { ctermfg = c.fg_muted_1, cterm = { underline = true } },
    --
    -- *Ignore		left blank, hidden  |hl-Ignore|
    Ignore                   = { ctermfg = 'NONE' },
    --
    -- *Error		any erroneous construct
    Error                    = { link = 'ErrorMsg' },
    --
    -- *Todo		anything that needs extra attention; mostly the
    Todo                     = { ctermfg = c.primary, ctermbg = 'NONE', cterm = { bold = true, underline = true } },
    --

    -- Set specific Treesitter node tags
    -- ["@type.qualifier"]      = { link = 'PreProc' },
    ["@text.danger"]         = { fg = c.fg_yellow, cterm = { underline = true } },
    ["@text.literal"]        = { link = 'NONE' },
    --

    -- Diagnostic
    DiagnosticError          = { link = 'Error' },
    DiagnosticWarn           = { link = 'WarningMsg' },
    DiagnosticInfo           = { link = 'DiffText' },
    DiagnosticHint           = { ctermbg = c.bg_green },
    DiagnosticUnderlineError = { ctermbg = 'NONE', ctermfg = 'NONE', cterm = { undercurl = true, sp = c.fg_red } },
    DiagnosticUnderlineWarn  = { ctermbg = 'NONE', ctermfg = 'NONE', cterm = { undercurl = true, sp = c.fg_orange } },
    DiagnosticUnderlineInfo  = { ctermbg = 'NONE', ctermfg = 'NONE', cterm = { undercurl = true, sp = c.fg_green } },
    DiagnosticUnderlineHint  = { ctermbg = 'NONE', ctermfg = 'NONE', cterm = { undercurl = true, sp = c.fg_green } },
    DiagnosticSignError      = { ctermbg = 'NONE', ctermfg = c.red },
    DiagnosticSignWarn       = { ctermbg = 'NONE', ctermfg = c.yellow },
    DiagnosticSignInfo       = { ctermbg = 'NONE', ctermfg = c.blue },
    DiagnosticSignHint       = { ctermbg = 'NONE', ctermfg = c.green },
    --

    -- nvim-cmp
    CmpItemAbbrMatch         = { ctermfg = c.primary },
    CmpItemAbbrSelect        = { link = 'Visual' },
    CmpItemAbbrMatchFuzzy    = { cterm = { bold = true } },
    --

    -- indent-blankline
    IndentBlanklineIndent1   = { ctermfg = c.fg_muted_1, cterm = { nocombine = true } },
    IndentBlanklineIndent2   = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent3   = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent4   = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent5   = { link = 'IndentBlanklineIndent1' },
    IndentBlanklineIndent6   = { link = 'IndentBlanklineIndent1' },
    --

    -- Telescope
    TelescopeNormal          = { link = 'NormalFloat' },
    TelescopeBorder          = { link = 'FloatBorder' },
    TelescopeSelection       = { link = 'Visual' },
    TelescopeMatching        = { ctermfg = c.primary },
    --
    -- git
    GitSignsAdd              = { ctermbg = 'NONE', ctermfg = c.green },
    GitSignsChange           = { ctermbg = 'NONE', ctermfg = c.yellow },
    GitSignsDelete           = { ctermbg = 'NONE', ctermfg = c.red },
    -- Statusline
    User1                    = { ctermbg = c.bg_muted_1, ctermfg = 'NONE' },
    User2                    = { ctermbg = c.bg_muted_1, ctermfg = c.primary },
    User3                    = { ctermbg = c.bg_muted_1, ctermfg = c.secondary },
    User4                    = { ctermbg = c.bg_muted_1, ctermfg = c.fg_muted_1 },
    User5                    = { ctermbg = c.bg_muted_1, ctermfg = c.red },
    User6                    = { ctermbg = c.bg_muted_1, ctermfg = c.green },
    User7                    = { ctermbg = c.bg_muted_1, ctermfg = c.yellow },
    User8                    = { ctermbg = c.bg_muted_1, ctermfg = c.blue },
    User9                    = { ctermbg = c.bg_muted_1, ctermfg = c.fg_muted_2 },
  }

  if opts and opts.highlights then
    highlights = vim.tbl_deep_extend('force', highlights, opts.highlights)
  end

  return highlights
end

return M
