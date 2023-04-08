# Declutter

Removing all the color clutter and retaining only the essential.

All colors are configured through Terminal app. Nothing is hardcoded. Modern terminals allow [16 ansi colors](https://jeffkreeftmeijer.com/vim-16-color/) to be set to whatever hex values you choose. This theme inherits colors from terminal, so you can configure the look on the fly. You will also get consistent look across shell commands.

## Screenshot

## Requirements

Neovim >= 8.0

## Installation

Install the theme with your preferred package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'girishji/declutter.nvim', { 'branch': 'main' }
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'girishji/declutter.nvim'
```

[Lazy](https://github.com/folke/lazy.nvim)

```lua
require("lazy").setup({
  { "girishji/declutter.nvim" },
})
```

## Usage

*Note:* Do not set ```termguicolors```.

Enable the colorscheme:

```vim
" Vim Script
colorscheme declutter
```

```lua
-- Lua
vim.cmd[[colorscheme declutter]]
```

To enable the `declutter` theme from `lazy.nvim`:

```lua
 -- ... your lazy.nvim config
  {
    "girishji/declutter.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'declutter'
    end,
  },  
   -- ... your lazy.nvim config
```

To enable the `declutter` theme for `Lualine`, simply specify it in your
lualine settings:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'declutter'
    -- ... your lualine config
  }
}
```

## Configuration

There is not much to configure. You could redefine highlight groups as follows.  

> ❗️ configuration needs to be set **BEFORE** loading the color scheme 

```lua
require("declutter").setup({
  highlights = {
    -- You can override specific highlight groups, either to use other colors
    --   link to another group
    -- To specify 'italic' style and black color for 'Comment':
    Comment = { ctermfg = 0, cterm = {italic = true} },
  },
})
```

## Overriding Colors & Highlight Groups

To override colors use the configuration options of your terminal app. To override highlight groups refer to `highlights` in [theme](lua/neology/theme.lua). Use the `highlighs` option passed to setup() function (above) to override color and style values. 


## Extras

Extra color configs for **iTerm** [extras](extras/).

