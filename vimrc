set nocompatible

let g:maplocalleader = ","

" Pathogen {{{
runtime bundle/vim-pathogen/autoload/pathogen.vim
filetype off " Needed so pathogen also loads ftdetect plugins.
call pathogen#infect('bundle/{}')
call pathogen#helptags()
" }}}

set number
set cursorline
set visualbell t_vb=
set ruler
set paste
set encoding=utf-8
scriptencoding utf-8
set autoindent " always set autoindenting on
set autoread " update a open file edited outside of Vim
set ttimeoutlen=50
set colorcolumn=80

" Display incomplete commands
set showcmd
set ignorecase
set smartcase

set ttyfast

""some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm

" Whitespaces {{{
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set backspace=indent,eol,start   " Allow backspacing over everything in insert mode
set linespace=1
" Display extra whitespace
set list listchars=tab:→\ ,trail:\ ,eol:¬

" Tab completion {{{
set wildmode=list:longest,list:full
set complete=.,w,t
set wildmenu
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.jpg,*.png,*.ttf,*.doc,*.pdf,*.gif,*.gz,vendor/gems/*
" }}}
" }}}


" Save as root {{{
cnoremap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>
" }}}

" Backup {{{
set nobackup
set nowritebackup
"set noswapfile

" Backup files directories
"set backupdir=~/.vimbackup,/tmp
" Swap files directories
set directory=~/.vimbackup,/tmp
" Keep 50 lines of command line history
set history=50
" }}}

" Colors and Fonts {{{

set guifont=Menlo:h12
set t_Co=256
set background=dark
colorscheme teaspoon

" }}}

"Statusline {{{

" Tail of the filename
set statusline=%f
" Filetype
set statusline+=%y
" Encoding
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}
" Git branch
set statusline+=%{fugitive#statusline()}
" Modified flag
set statusline+=%m
" Left/right separator
set statusline+=%=
" Cursor column
set statusline+=%c,
" Cursor line/total lines
set statusline+=%l/%L
" Percent through file
set statusline+=\ %P
set laststatus=2

" }}}

" Search {{{
" fixes crazy regex style to what I expect to be
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

set incsearch
set hlsearch

" }}}

" Mappings {{{

" Keep visual mode after indenting
vnoremap < <gv
vnoremap > >gv

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
noremap <Leader>e :edit <C-R>=expand("%:p:h") . "/" <CR>
noremap <Leader>vs :vsplit <C-R>=expand("%:p:h") . "/" <CR>
noremap <Leader>sp :split <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>te
noremap <Leader>te :tabedit <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>


" Hitting F5 will clean out all trailing whitespace or tabs
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" switch off F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" }}}

" Unite
source ~/.vim/sections/unite

" Airline {{{
let g:airline_theme = 'powerlineish'
let g:airline_enable_branch = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = 'foo'
let g:airline#extensions#syntastic#enabled = 1
let g:airline_detect_paste = 0
let g:airline_detect_modified = 1
let g:airline_powerline_fonts = 0
let g:airline_detect_whitespace = 1
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#whitespace#trailing_format = 't %s'
let g:airline#extensions#whitespace#mixed_indent_format = 'm %s'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline#extensions#bufferline#enabled = 0

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.branch = '☍'
let g:airline_symbols.linenr = '♒︎'

let g:airline_section_c = '%f'

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" }}}

" GitGutter {{{
noremap <LocalLeader>ggn :GitGutterNextHunk <CR>
noremap <LocalLeader>ggp :GitGutterPrevHunk <CR>
noremap <LocalLeader>ggh :GitGutterLineHighlightsToggle <CR>
noremap <LocalLeader>ggt :GitGutterToggle <CR>

let g:gitgutter_eager = 0
" }}}


" Emmet {{{
let g:user_emmet_expandabbr_key = '<c-z>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
\  'indentation' : '  '
\}
" }}}

" R {{{
let g:vimrplugin_vsplit = 1
let g:ScreenImpl = 'Tmux'
" }}}


let g:ragtag_global_maps = 1

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set nohlsearch
endif

" Filetypes {{{
if has("autocmd")
  augroup vimrc
    autocmd!

    " Save and load folds
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview

  augroup END

  augroup filetypedetect
    " Treat RDF/XML files like XML
    autocmd BufNewFile,BufRead *.{rdf,rdfs,owl} set ft=xml
    " Reformat XML
    " TODO: verify what happen when a non-UTF-8 XML is saved after xmllint
    " au FileType xml exe \":silent 1,$!xmllint --format --encode UTF-8 --recover - 2>/dev/null"
    let g:xml_syntax_folding = 1
    " TODO: use a remap
    "set foldmethod=syntax

    " RDF Notation 3 Syntax
    autocmd BufNewFile,BufRead *.n3,*.ttl,*.trig  setfiletype n3
    autocmd BufNewFile,BufRead *.rq,*.sparql  setfiletype sparql
    let g:NERDCustomDelimiters = {
      \ 'n3': { 'left': '# ' },
      \ 'ttl': { 'left': '# ' },
      \ 'dockerfile': { 'left': '# ' },
      \ 'sparql': { 'left': '# ' }
    \ }

    function s:setupWrapping()
      set wrap
      set wrapmargin=2
      set textwidth=72
    endfunction

    " Make sure all markdown files have the correct filetype set and setup wrapping
    autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()
    autocmd FileType dockerfile set commentstring=#\ %s

    " ruby-xmpfilter {{{
    autocmd FileType ruby nmap <buffer> <C-m> <Plug>(xmpfilter-mark)
    autocmd FileType ruby xmap <buffer> <C-m> <Plug>(xmpfilter-mark)
    autocmd FileType ruby imap <buffer> <C-m> <Plug>(xmpfilter-mark)

    autocmd FileType ruby nmap <buffer> <C-r> <Plug>(xmpfilter-run)
    autocmd FileType ruby xmap <buffer> <C-r> <Plug>(xmpfilter-run)
    autocmd FileType ruby imap <buffer> <C-r> <Plug>(xmpfilter-run)

    let g:xmpfilter_cmd = "seeing_is_believing"

    autocmd FileType ruby nmap <buffer> <C-m> <Plug>(seeing_is_believing-mark)
    autocmd FileType ruby xmap <buffer> <C-m> <Plug>(seeing_is_believing-mark)
    autocmd FileType ruby imap <buffer> <C-m> <Plug>(seeing_is_believing-mark)

    autocmd FileType ruby nmap <buffer> <C-c> <Plug>(seeing_is_believing-clean)
    autocmd FileType ruby xmap <buffer> <C-c> <Plug>(seeing_is_believing-clean)
    autocmd FileType ruby imap <buffer> <C-c> <Plug>(seeing_is_believing-clean)

    " xmpfilter compatible
    autocmd FileType ruby nmap <buffer> <C-r> <Plug>(seeing_is_believing-run_-x)
    autocmd FileType ruby xmap <buffer> <C-r> <Plug>(seeing_is_believing-run_-x)
    autocmd FileType ruby imap <buffer> <C-r> <Plug>(seeing_is_believing-run_-x)

    " auto insert mark at appropriate spot.
    autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing_is_believing-run)
    autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing_is_believing-run)
    autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing_is_believing-run)
    " }}}

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    " filetype plugin indent on

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
  augroup END

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif
" }}}
