set nocompatible

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
au BufWinEnter,BufNewFile * silent tab

setlocal textwidth=100
set colorcolumn=101
au BufEnter <buffer> set colorcolumn=101

" syntax
" define <Leader>
let g:mapleader=";"

syntax enable
syntax on
" display line number
set number
" detect filetype
filetype on
filetype indent on
filetype plugin on

" vundle settings
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" managed plugin names
Plugin 'VundleVim/Vundle.vim'
Plugin 'arzg/vim-colors-xcode'
Plugin 'lifepillar/vim-solarized8'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kshenoy/vim-signature'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" define <Leader>
let g:mapleader=";"

" shortcuts for line begining and end nmap lb ^
nmap lb ^
nmap le $

" set color scheme
set background=dark
colorscheme solarized8
"colorscheme xcodedarkhc

" common shortcuts with <Leader>
vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>
nnoremap <Leader>nw <C-W><C-W>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j
nmap <Leader>M %

" necessary settings
set incsearch
set ignorecase
set wildmenu

" always show status bar
set laststatus=2
" do not display nonreadable characters
set nolist
" display coordinate info
set ruler
" display command info
set showcmd
" highlight the current line
set cursorline

" highlight the matched pattern
set hlsearch
" no highlight
map <Leader>nh :nohl<CR>
" jump to the next word
nmap <Leader>n *
" jump to the previsou word
nmap <Leader>p #

" tab settings
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" foldable
" set foldmethod=indent
set foldmethod=syntax
set nofoldenable
map <leader>z zazR

" switch between source file and header file
nmap <silent> <Leader>sw :FSHere<cr>

" vim signature settings
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" code template
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>" 
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" skip parenthesiss
func SkipPair()
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}' || getline('.')[col('.') - 1] == '>' || getline('.')[col('.') - 1] == '|'
        return "\<ESC>la"
    else
        return "\t"
    endif
endfunc
inoremap <Leader>a <c-r>=SkipPair()<CR>

" manual append parenthesis
func ClosePairs()
  if getline('.')[col('.') - 2] == '('
    return ")\<ESC>i"
  elseif getline('.')[col('.') - 2] == '['
    return "]\<ESC>i"
  elseif getline('.')[col('.') - 2] == '{'
    return "}\<ESC>i"
  elseif getline('.')[col('.') - 2] == "\'"
    return "\"\<ESC>i"
  elseif getline('.')[col('.') - 2] == "\""
    return "\"\<ESC>"
  else
    return ""
  endif
endfunc
inoremap <Leader>v <c-r>=ClosePairs()<CR>

" nerdtree configs
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" show/hide MiniBufExplorer window
map <Leader>bm :MBEToggle<cr>
" shortcut for switch
map <Leader>bn :MBEbn<cr>
map <Leader>bp :MBEbp<cr>
map <Leader>bq :MBEbd<cr>

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_mruf_case_sensitive = 0
let g:ctrlp_max_files = 100000
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_regexp = 1
let g:ctrlp_open_multiple_files = 'v'

" undo tree
nnoremap <Leader>ud :UndotreeToggle<CR>

" extra whiltespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" ycm config
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
"let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_cache_omnifunc=0
