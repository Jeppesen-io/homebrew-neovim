" Enable <Tab> complete on sugestions, otherwise work normaly
" for deopleat plugin
inoremap <silent><expr> <Tab>  pumvisible() ? "<C-n>" : "<Tab>"

" Enable deoplete (neovim autocomplete)
let g:deoplete#enable_at_startup = 1
