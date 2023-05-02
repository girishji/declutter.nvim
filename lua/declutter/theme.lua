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

M.get_colors = function()
  local background = vim.o.background
  return {
    fg = background == 'light' and 0 or 7,
    red = 1,
    green = 2,
    yellow = 3,
    blue = 4,
    magenta = 5,
    cyan = 6,
    bg = background == 'light' and 7 or 0,
    br_fg = background == 'light' and 8 or 15,
    br_red = 9,
    br_green = 10,
    br_yellow = 11,
    br_blue = 12,
    br_magenta = 13,
    br_cyan = 14,
    br_bg = background == 'light' and 15 or 8,
  }
end

function M.setup(opts)
  local c = M.get_colors()

  local highlights = {
    -- VIM UI
    -- https://vimdoc.sourceforge.net/htmldoc/syntax.html
    -- By not setting Normal and NormalNC we get bg and fg set by Terminal, including transparent bg.
    -- Normal = for Normal mindowns, NormalNC = for non current windows
    Cursor                   = { ctermbg = c.yellow },
    CursorLine               = { ctermbg = c.br_bg, cterm = {} },
    CursorLineNr             = { ctermbg = c.br_bg, ctermfg = c.br_fg, cterm = {} },
    -- MatchParen             = { ctermbg = c.bg },
    -- ColorColumn            = { ctermbg = c.bg },
    SpellBad                 = { ctermfg = c.red, cterm = { underline = true } },
    SpellCap                 = { ctermfg = c.green, cterm = { underline = true } },
    SpellRare                = { ctermfg = c.yellow, cterm = { underline = true } },
    SpellLocal               = { ctermfg = c.blue, cterm = { underline = true } },
    NonText                  = { ctermfg = c.br_fg }, -- some text in :nmap
    LineNr                   = { ctermfg = c.fg },
    Visual                   = { ctermbg = c.bg },
    -- IncSearch              = { ctermfg = c.primary, cterm = { reverse = true } },
    -- Search                 = { ctermfg = c.primary, ctermbg = c.secondary_bg },
    StatusLine               = { ctermbg = c.br_bg },
    StatusLineNC             = { ctermbg = 'NONE' },
    TabLine                  = { ctermbg = c.br_bg },
    TabLineSel               = { ctermbg = c.br_bg },
    -- Folded                 = { ctermfg = c.primary, cterm = { bold = true } },
    -- Conceal                = { ctermfg = c.primary },
    Directory                = { ctermfg = c.blue },
    Title                    = { ctermfg = c.yellow, cterm = { bold = true } },
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
    DiffAdd                  = { ctermbg = c.br_bg, ctermfg = c.green },
    DiffChange               = { ctermbg = c.br_bg, ctermfg = c.yellow },
    DiffDelete               = { ctermbg = c.br_bg, ctermfg = c.red },
    DiffText                 = { ctermbg = c.br_bg, ctermfg = c.blue, cterm = { bold = true } },
    --
    -- Floating Windows
    FloatBorder              = { ctermfg = 'NONE', ctermbg = c.br_bg },
    NormalFloat              = { ctermfg = 'NONE', ctermbg = c.br_bg }, -- Normal text in floating windows.
    FloatTitle               = { cterm = { bold = true } },
    -- NormalSB            = { ctermfg = c.fg_sidebar, ctermbg = c.bg_sidebar }, -- normal text in sidebar
    --
    -- WinSeparator             = { link = 'FloatBorder' },
    --
    Pmenu                    = { link = 'NormalFloat' },
    PmenuSel                 = { link = 'Visual' },
    PmenuSBar                = { link = 'Visual' },   -- scrollbar
    PmenuThumb               = { ctermbg = c.br_fg }, -- thumb of scrollbar
    --
    -- Generic syntax
    -- https://vimdoc.sourceforge.net/htmldoc/syntax.html
    --    *Comment	any comment
    Comment                  = { ctermfg = c.br_fg, cterm = { italic = true } },
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
    ["@function"]            = { ctermfg = 'NONE', cterm = { bold = true } },
    ["@function.call"]       = { ctermfg = 'NONE', cterm = {} },
    ["@function.builtin"]    = { ctermfg = 'NONE', cterm = {} },
    ["@method"]              = { ctermfg = 'NONE', cterm = { bold = true } },
    ["@method.call"]         = { ctermfg = 'NONE', cterm = {} },
    ["@method.builtin"]      = { ctermfg = 'NONE', cterm = {} },
    ["@class_name"]          = { ctermfg = 'NONE', cterm = { bold = true } },
    ["@interface_name"]      = { link = 'class_name' },
    ["@record_name"]         = { link = 'class_name' },
    ["@enum_name"]           = { link = 'class_name' },
    --
    -- *Statement	any statement
    --  Conditional	if, then, else, endif, switch, etc.
    --  Repeat		for, do, while, etc.
    --  Label		case, default, etc.
    --  Operator	"sizeof", "+", "*", etc.
    --  Keyword	        any other keyword (class, return, etc.)
    --  Exception	try, catch, throw
    Statement                = { ctermfg = 'NONE' },
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
    Delimiter                = { ctermfg = c.yellow, cterm = {} }, -- operator symbols
    --
    -- *Underlined	text that stands out, HTML links
    Underlined               = { ctermfg = c.br_fg, cterm = { underline = true } },
    --
    -- *Ignore		left blank, hidden  |hl-Ignore|
    Ignore                   = { ctermfg = 'NONE' },
    --
    -- *Error		any erroneous construct
    Error                    = { link = 'ErrorMsg' },
    --
    -- *Todo		anything that needs extra attention; mostly the
    Todo                     = { ctermfg = c.yellow, ctermbg = 'NONE', cterm = { bold = true, underline = true } },
    --

    -- Set specific Treesitter node tags
    -- ["@type.qualifier"]      = { link = 'PreProc' },
    ["@text.danger"]         = { ctermfg = c.yellow, cterm = { underline = true } },
    ["@text.uri"]            = { ctermfg = c.br_fg },
    ["@text.literal"]        = { link = 'NONE' },
    --

    -- Diagnostic
    DiagnosticError          = { link = 'Error' },
    DiagnosticWarn           = { link = 'WarningMsg' },
    DiagnosticInfo           = { link = 'DiffText' },
    DiagnosticHint           = { ctermbg = c.br_bg, ctermfg = c.green },
    DiagnosticSignError      = { ctermbg = 'NONE', ctermfg = c.red },
    DiagnosticSignWarn       = { ctermbg = 'NONE', ctermfg = c.yellow },
    DiagnosticSignInfo       = { ctermbg = 'NONE', ctermfg = c.blue },
    DiagnosticSignHint       = { ctermbg = 'NONE', ctermfg = c.green },
    --

    -- nvim-cmp
    CmpItemAbbrMatch         = { ctermfg = c.yellow },
    CmpItemAbbrSelect        = { link = 'Visual' },
    CmpItemAbbrMatchFuzzy    = { cterm = { bold = true } },
    --

    -- indent-blankline
    IndentBlanklineIndent1   = { ctermfg = c.fg, cterm = { nocombine = true } },
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
    TelescopeMatching        = { ctermfg = c.yellow },
    --
    -- git
    GitSignsAdd              = { ctermbg = 'NONE', ctermfg = c.green },
    GitSignsChange           = { ctermbg = 'NONE', ctermfg = c.yellow },
    GitSignsDelete           = { ctermbg = 'NONE', ctermfg = c.red },
    -- Statusline
    User1                    = { ctermbg = c.br_bg, ctermfg = 'NONE' },
    User2                    = { ctermbg = c.bg, ctermfg = 'NONE' },
    User3                    = { ctermbg = c.br_bg, ctermfg = c.magenta },
    User4                    = { ctermbg = c.br_bg, ctermfg = c.fg },
    User5                    = { ctermbg = c.br_bg, ctermfg = c.red },
    User6                    = { ctermbg = c.br_bg, ctermfg = c.green },
    User7                    = { ctermbg = c.br_bg, ctermfg = c.yellow },
    User8                    = { ctermbg = c.br_bg, ctermfg = c.blue },
    User9                    = { ctermbg = c.br_bg, ctermfg = 'NONE', cterm = { italic = true } },
    -- Treesitter
    ["@type.qualifier"]      = { ctermfg = 'NONE', cterm = { italic = true } },
    ["@type.builtin"]        = { link = "@type.qualifier" },
    ["@keyword.return"]      = { link = "@type.qualifier" },
    ["@variable.builtin"]    = { link = "@type.qualifier" },
    -- treesitter for markdown (treesitter.lua)
    FencedCodeBlock          = { ctermbg = c.br_bg },
    BlockQuote               = { link = 'FencedCodeBlock' },
    ["@code.inline"]         = { ctermbg = c.br_bg },
    ["@deemphasize"]         = { ctermfg = c.fg },
    ["@text.emphasis"]       = { cterm = { italic = true } },
    ["@text.strong"]         = { cterm = { bold = true } },
    ["@text.inline_link"]    = { ctermfg = c.blue },
    ["@text.todo.checked"]   = { ctermfg = c.cyan },
    ["@text.todo.unchecked"] = { link = "@text.todo.checked" },
  }

  if opts and opts.highlights then
    highlights = vim.tbl_deep_extend('force', highlights, opts.highlights)
  end

  return highlights
end

return M
