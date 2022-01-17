local lsp_installer = require "nvim-lsp-installer"

-- Include the servers you want to have installed by default below
local servers = {
  "tsserver",
  "sumneko_lua",
  "volar",
  "jsonls",
  "html",
  "cssls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

local on_attach = function(_, bufnr)
  nmapb(bufnr, 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  nmapb(bufnr, '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  nmapb(bufnr, '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  -- nmapb(bufnr, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  -- nmapb(bufnr, '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  nmapb(bufnr, '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
  nmapb(bufnr, '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  nmapb(bufnr, ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  -- Telescope mappings
  nmapb(bufnr, 'gr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]])
  nmapb(bufnr, 'gd',[[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]])
  nmapb(bufnr, 'gD',[[<cmd>lua require('telescope.builtin').lsp_declarations()<CR>]])
  nmapb(bufnr, 'gi',[[<cmd>lua require('telescope.builtin').lsp_implementations()<CR>]])
  nmapb(bufnr, '<leader>D',[[<cmd>lua require('telescope.builtin').lsp_type_definitions<CR>]])
  nmapb(bufnr, '<leader>qf',[[<cmd>lua require('telescope.builtin').quickfix()<CR>]])
  nmapb(bufnr, '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
  nmapb(bufnr, '<leader>sw', [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>]])
  nmapb(bufnr, '<leader>sr', [[<cmd>lua require('telescope.builtin').registers()<CR>]])
  nmapb(bufnr, '<leader>ca', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]])
  nmapb(bufnr, '<leader>t', '<cmd>Neoformat<CR>')

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local enhance_server_opts = {
  ['sumneko_lua'] = function(opts)
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")
    opts.cmd = { os.getenv("HOME") .. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server" }
    opts.settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    }
  end
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local opts = {
    cmd = nil,
    on_attach = on_attach,
    capabilities = capabilities
  }

  if enhance_server_opts[server.name] then
    -- Enhance the default opts with the server-specific ones
    enhance_server_opts[server.name](opts)
  end

  server:setup(opts)
end)
