call plug#begin()

" dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }

" vim-airline
Plug 'vim-airline/vim-airline'

call plug#end()

let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1

colorscheme dracula


