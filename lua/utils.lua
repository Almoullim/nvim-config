-- Handy aliases
map = vim.api.nvim_set_keymap -- to map keys
mapb = vim.api.nvim_buf_set_keymap -- to map keys
cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()

nmap = function(key, cmd, options)
  map('n', key, cmd, options or { noremap = true, silent = true })
end

imap = function(key, cmd, options)
  map('n', key, cmd, options or { noremap = true, silent = true })
end

vmap = function(key, cmd, options)
  map('v', key, cmd, options or { noremap = true, silent = true })
end

xmap = function(key, cmd, options)
  map('x', key, cmd, options or { noremap = true, silent = true })
end

lmap = function(key, cmd, options)
  nmap('<leader>' .. key, cmd, options)
end


-- Buffer map
nmapb = function(bufrn, key, cmd, options)
  mapb(bufrn, 'n', key, cmd, options or { noremap = true, silent = true })
end

imapb = function(bufrn, key, cmd, options)
  mapb(bufrn, 'n', key, cmd, options or { noremap = true, silent = true })
end

vmapb = function(bufrn, key, cmd, options)
  mapb(bufrn, 'v', key, cmd, options or { noremap = true, silent = true })
end

xmapb = function(bufrn, key, cmd, options)
  mapb(bufrn, 'x', key, cmd, options or { noremap = true, silent = true })
end

lmapb = function(bufrn, key, cmd, options)
  nmapb(bufrn, '<leader>' .. key, cmd, options)
end


set_options = function(locality,options)
  for key, value in pairs(options) do
    locality[key] = value
  end
end
