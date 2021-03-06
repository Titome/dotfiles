" vim-plug configuration
call plug#begin('~/.vim/plugged')

" Add or remove your Bundles here:
Plug 'bling/vim-airline'
Plug 'chase/vim-ansible-yaml'
Plug 'dpelle/vim-Grammalecte'
Plug 'flazz/vim-colorschemes'
Plug 'evidens/vim-twig'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'johngrib/vim-game-code-break'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'posva/vim-vue'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'stephpy/vim-php-cs-fixer'
"Plug 'stephpy/vim-yaml'
"Plug 'sjbach/lusty'
Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-scripts/LycosaExplorer'

call plug#end()

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
endif

filetype plugin indent on

syntax on
set number
set showcmd
set ignorecase                     " Ignore la case lors d'une recherche
set mouse=a
set background=dark

if has('gui_running')
    colorscheme solarized
else
    colorscheme atom
endif

set ruler
set wildmode=list:longest

set bs=indent,eol,start

set incsearch
set hlsearch
set smartcase

set smartindent                    " Indentation intelligente
set autoindent                     " Conserve l'indentation sur une nouvelle ligneset softtabstop=4
set tabstop=4                      " Indentation toutes les quatre colonnes
set shiftwidth=4
set expandtab
set shiftround
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac
set autoread                       " Set to auto read when a file is changed from the outside
set colorcolumn=80
set wildmenu

" twig
"autocmd BufRead *.twig set filetype=htmltwig.html
autocmd BufNewFile,BufRead *.less set filetype=less

" police
set guifont=Source\ Code\ Pro\ 10
set antialias

" changement de la touche échap
:imap ;; <Esc>
:map ;; <Esc>

" Définition de la touche leader
let mapleader = ","

" Configuration du shell avec fish par défaut pour le système
set shell=/bin/bash

" Remove trailing
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Configuration orthographique
map <silent> <F7> "<Esc>:silent setlocal spell! spelllang=en<CR>"
map <silent> <F6> "<Esc>:silent setlocal spell! spelllang=fr<CR>"


" CONFIGURATION DES PLUGINS


" Configuration LycosaExplorer
set hidden

" Configuration d'Ack

" Parametres par défaut pour ack
let g:ackprg="ack -H --nocolor --nogroup --column"

" Place un marqueur et cherche
nmap <leader>j mA:Ack<space>

" Place un marqueur et cherche le mot sous le curseur
nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
nmap <leader>jA mA:Ack "<C-r>=expand("<cWORD>")<cr>"

" Configuration de CtrlP

let g:ctrlp_map = '<leader>c'

" Ignore cache files for Symfony2
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]app/cache$'
    \ }

" Configuration de neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Airline
set laststatus=2

" Configuration de Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Tagbar
nmap <F8> :TagbarToggle<CR>

" neosnippet

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Configuration de Grammalecte
let g:grammalecte_cli_py='/opt/grammalecte/cli.py'
