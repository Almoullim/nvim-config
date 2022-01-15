require 'utils'

local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  nmapb(bufnr, 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  nmapb(bufnr, 'gd', '<cmd>lua vim.lsp.buf.definition)<CR>')
  nmapb(bufnr, 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  nmapb(bufnr, 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  nmapb(bufnr, '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  nmapb(bufnr, '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  nmapb(bufnr, '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  nmapb(bufnr, '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  nmapb(bufnr, '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  nmapb(bufnr, '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  nmapb(bufnr, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  nmapb(bufnr, '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  nmapb(bufnr, '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
  nmapb(bufnr, '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  nmapb(bufnr, ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  nmapb(bufnr, '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')
  nmapb(bufnr, '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end


-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'tsserver', 'sumneko_lua' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
