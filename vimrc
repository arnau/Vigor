set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Helpers {{{
Plug 'Shougo/vimproc.vim', { 'do': 'make' } | Plug 'Shougo/vimshell.vim'
" Plug 'Shougo/unite.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'w0rp/ale'
" }}}


" Context {{{
Plug 'airblade/vim-gitgutter' | Plug 'kshenoy/vim-signature'
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['rust']
Plug 'ap/vim-css-color'
" }}}

" Colorschemes {{{
Plug 'junegunn/limelight.vim'
Plug 'arnau/teaspoon.vim'
Plug 'arnau/stonespoon.vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': '/vim'}
Plug 'joshdick/onedark.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'tomasr/molokai'
Plug 'vim-scripts/Wombat'
Plug 'zaki/zazen'
Plug 'kamwitsta/mythos'
Plug 'KeitaNakamura/neodark.vim'
Plug 'xero/blaquemagick.vim'
Plug 'jacoborus/tender.vim'
Plug 'zanglg/nova.vim'
" }}}

" Languages {{{
"Plug 'vim-scripts/Emmet.vim'

Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  set nocursorline
  set listchars=
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  set cursorline
  set listchars=tab:→\ ,trail:\ ,eol:¬
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

Plug 'chrisbra/csv.vim', { 'for': 'csv' }

Plug 'fatih/vim-go'

Plug 'docker/docker' , { 'rtp': '/contrib/syntax/vim' }

Plug 'pangloss/vim-javascript'

Plug 'arnau/sparql.vim'

Plug 'cespare/vim-toml'

Plug 'vim-scripts/n3.vim'

Plug 'moskytw/nginx-contrib-vim'

Plug 'JuliaLang/julia-vim'

Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Plug 'elmcast/elm-vim'
Plug 'lambdatoast/elm.vim'

Plug 'elixir-lang/vim-elixir'

Plug 'the-lambda-church/merlin', { 'rtp': '/vim/merlin' }

Plug 'raichoo/purescript-vim'
" }}}

call plug#end()

" set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

source ~/.vim/sections/basics.vim
source ~/.vim/sections/file_types.vim
source ~/.vim/sections/gitgutter.vim
source ~/.vim/sections/limelight.vim
source ~/.vim/sections/airline.vim
" source ~/.vim/sections/unite.vim
source ~/.vim/sections/fzf.vim
source ~/.vim/sections/ale.vim


" Signature {{{
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
" }}}
