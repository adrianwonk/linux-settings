let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'rose-pine/vim'

call plug#end()

set hls
syntax on
filetype plugin indent on
colorscheme industry
set laststatus=2

highlight Normal       ctermbg=NONE guibg=NONE
highlight NonText      ctermbg=NONE guibg=NONE
highlight EndOfBuffer  ctermbg=NONE guibg=NONE
highlight LineNr       ctermbg=NONE guibg=NONE
highlight SignColumn   ctermbg=NONE guibg=NONE

set number
set relativenumber
set cursorline
set linebreak

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set scrolloff=10

set cmdheight=1
set shortmess+=aoOtT

augroup netrw_silent
    autocmd!
    autocmd FileType netrw :
augroup END

let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro cul'


highlight CursorLine gui=NONE cterm=NONE guibg=#3a3a3a ctermbg=237
highlight CursorLineNr gui=italic cterm=italic guifg=#af0000 ctermfg=124 guibg=#3a3a3a ctermbg=237
highlight LineNrAbove gui=italic cterm=italic guifg=#6c7a89 ctermfg=66
highlight LineNrBelow gui=italic cterm=italic guifg=#ffafd7 ctermfg=218

let mapleader = " "
nnoremap <leader>q :w<CR>:Explore<CR>
inoremap jj <Esc>
