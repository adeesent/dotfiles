call plug#begin('~/.config/nvim/plugged')
Plug 'chr4/nginx.vim'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color' 
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

" Basic configuration {{{1
" Disable compatibility with vi {{{2
set nocompatible

" Theme {{{2
colorscheme onedark

" Tabs {{{2 
set tabstop=4
set shiftwidth=4
set smartindent

" Syntax highlighting {{{2
syntax enable

" Enable plugin support {{{2
filetype plugin on

" Enable search path for files {{{2
set path+=**

" Tab-complition all matches {{{2
set wildmenu

" File browsing {{{2
" Disable banner {{{3
let g:netrw_banner=0

" Open in prior window {{{3
let g:netrw_browse_split=4

" Open splits to the right {{{3
let g:netrw_altv=1

" Tree view {{{3
let g:netrw_liststyle=3

" Spellchecking {{{2
map <F6> :setlocal spell! spelllang=en_us<CR>

" Spellcheck for git commit {{{3
autocmd Filetype gitcommit setlocal spell textwidth=72

" Languages {{{1
" Go {{{2
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Separate delete registers
nnoremap dd "_d_d
nnoremap x "_x

" Plugins {{{1
" fzf {{{2
set rtp+=/usr/local/opt/fzf
nmap <C-p> :Files<CR>
nmap ; :Buffers<CR>

" coc {{{2
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif
