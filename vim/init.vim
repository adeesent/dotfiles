call plug#begin('~/.vim/plugged')
Plug 'chr4/nginx.vim'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color' 
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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
