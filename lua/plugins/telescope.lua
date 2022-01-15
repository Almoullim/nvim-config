
 require('telescope').setup {
   defaults = {
     file_ignore_patterns = {"node_modules"},
     mappings = {
       i = {
         -- ['<C-u>'] = false,
         -- ['<C-d>'] = false,
       },
     },
     layout_config = {
       vertical = { width = 0.5 }
       -- other layout configuration here
     },
   },
   pickers = {
     find_files = { theme = "dropdown", },
     buffers = { theme = "dropdown", },
     current_buffer_fuzzy_find = { theme = "dropdown", },
     tags = { theme = "dropdown", },
     grep_string = { theme = "dropdown", },
     live_grep = { theme = "dropdown", },
     oldfiles = { theme = "dropdown", },
     quickfix = { theme = "dropdown", },
     lsp_document_symbols = { theme = "dropdown", },
     registers = { theme = "dropdown", },
     lsp_code_actions = { theme = "cursor", },
     lsp_references = { theme = "dropdown", },
     lsp_definitions = { theme = "dropdown", },
     lsp_declarations = { theme = "dropdown", },
     lsp_implementations = { theme = "dropdown", },
     lsp_type_definitions = { theme = "dropdown", },
   }
 }
