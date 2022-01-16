-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  -- Git integration
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines

  -- Tags
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management

  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' },  config = function() require('plugins.telescope') end }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }, config = function() require('plugins.lualine') end }

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use { 'nvim-treesitter/nvim-treesitter'  , config = function() require('plugins.nvim-treesitter') end }
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- LSP
  use { 'neovim/nvim-lspconfig' } -- Collection of configurations for built-in LSP client
  use { 'williamboman/nvim-lsp-installer', config = function() require('plugins.lsp-installer') end  } -- LSP Installer

  -- Autocompletion plugin
  use { 'hrsh7th/nvim-cmp', config = function() require('plugins.nvim-cmp') end }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- File explorer
  use { 'lambdalisue/fern.vim', config = function() require('plugins.fern') end }
  use 'antoinemadec/FixCursorHold.nvim' -- a fix for Fern

  -- Formatting
  use { "sbdchd/neoformat", cmd = { "Neoformat" } }

  -- Themes
  use 'joshdick/onedark.vim'
  -- use { 'lifepillar/vim-gruvbox8' }
  -- use 'tiagovla/tokyodark.nvim'
end)
