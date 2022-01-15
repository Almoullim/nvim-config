require 'utils'

cmd [[
function! s:init_fern() abort
  nmap <buffer><expr>
      \ <Plug>(fern-my-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-collapse)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )

  nmap <buffer><nowait> <C-l> <C-w>l
  nmap <buffer> q :<C-u>quit<CR>
  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p
  nmap <buffer> I <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
endfunction


augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
]]


-- nmap <buffer><nowait> <Enter> <Plug>(fern-my-expand-or-collapse)
