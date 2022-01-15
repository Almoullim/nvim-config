require 'utils'

--Remap space as leader key
map('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
nmap('k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
nmap('j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Telescope
lmap('<space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
lmap('sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]])
lmap('sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
lmap('sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
lmap('st', [[<cmd>lua require('telescope.builtin').tags()<CR>]])
lmap('sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]])
lmap('sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
lmap('so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]])
lmap('?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])

-- Fern
lmap('n', [[<cmd>Fern . -drawer -reveal=%<CR>]])

-- Easier window navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Allow misspellings
cmd(':command! WQ wq')
cmd(':command! WQ wq')
cmd(':command! Wq wq')
cmd(':command! Wqa wqa')
cmd(':command! W w')
cmd(':command! Q q')
