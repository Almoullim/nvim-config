require 'utils'

local options = {
  hlsearch = false, --Set highlight on search
  mouse = 'a', --Enable mouse mode
  breakindent = true, --Enable break indent
  --Case insensitive searching UNLESS /C or capital in search
  ignorecase = true,
  smartcase = true,

  -- Tabs
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,

  undofile = true,  --Save undo history
  updatetime = 250, --Decrease update time
  termguicolors = true,
  -- Set completeopt to have a better completion experience
  completeopt = 'menuone,noselect'
}


local global_options = {
  nocompatiple = true,

  --Map blankline
  indent_blankline_char = '┊',
  indent_blankline_filetype_exclude = { 'help', 'packer' },
  indent_blankline_buftype_exclude = { 'terminal', 'nofile' },
  indent_blankline_show_trailing_blankline_indent = false,


  onedark_terminal_italics = 2,
}


local window_options = {
  number = true, --Make line numbers default
  signcolumn = 'yes'
}


local buffer_options = {
}

set_options(vim.o, options)
set_options(vim.g, global_options)
set_options(vim.wo, window_options)
set_options(vim.bo, buffer_options)

-- Load the colorscheme
cmd [[colorscheme onedark]]
-- cmd [[colorscheme nord]]
-- cmd [[colorscheme tokyodark]]

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
