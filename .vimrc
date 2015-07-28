"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/timothee/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/timothee/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'bling/vim-airline'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'evidens/vim-twig'
NeoBundle 'Glench/Vim-Jinja2-Syntax'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'stephpy/vim-yaml'
NeoBundle 'sjbach/lusty'
NeoBundle 'Shougo/neocomplcache'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

syntax on
set number
set showcmd
set ignorecase              " Ignore la case lors d'une recherche
set mouse=a
set background=dark
colorscheme solarized

set ruler
set wildmode=list:longest

set bs=indent,eol,start

set incsearch
set hlsearch
set smartcase

set smartindent     " Indentation intelligente
set autoindent      " Conserve l'indentation sur une nouvelle ligneset softtabstop=4
set tabstop=4       " Indentation toutes les quatre colonnes
set shiftwidth=4
set expandtab
set shiftround

" twig
"autocmd BufRead *.twig set filetype=htmltwig.html
autocmd BufNewFile,BufRead *.less set filetype=less

" police
set guifont=Source\ Code\ Pro
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


" CONFIGURATION DES PLUGINS


" Configuration LustyExplorer
set hidden
nmap <leader>lh :LustyFilesystemExplorerFromHere<CR>

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
