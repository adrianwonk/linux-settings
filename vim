syntax on
filetype plugin indent on

colorscheme industry

highlight Normal       ctermbg=NONE guibg=NONE
highlight NonText      ctermbg=NONE guibg=NONE
highlight EndOfBuffer  ctermbg=NONE guibg=NONE
highlight LineNr       ctermbg=NONE guibg=NONE
highlight SignColumn   ctermbg=NONE guibg=NONE

set number
set relativenumber
set cursorline
set linebreak
set syntax

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set scrolloff=10

set cmdheight=2
set shortmess+=aoOtT

augroup netrw_silent
    autocmd!
    autocmd FileType netrw :
augroup END

let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro cul'

set colorcolumn=80

highlight ColorColumn ctermbg=27 guibg=#2e89ff

highlight CursorLine gui=NONE cterm=NONE guibg=#3a3a3a ctermbg=237
highlight CursorLineNr gui=italic cterm=italic guifg=#af0000 ctermfg=124 guibg=#3a3a3a ctermbg=237
highlight LineNrAbove gui=italic cterm=italic guifg=#6c7a89 ctermfg=66
highlight LineNrBelow gui=italic cterm=italic guifg=#ffafd7 ctermfg=218

let mapleader = " "
nnoremap <leader>q :w<CR>:Explore<CR>
inoremap jj <Esc>
