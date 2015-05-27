" syntax 
" define <Leader>
let mapleader=";"

syntax enable
syntax on
" display line number
set number
" set width limit
set textwidth=80
set colorcolumn=81
" detect filetype
filetype on
filetype plugin on

" set color theme
set t_Co=256
set background=dark
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme dusk

" no cursor blinking
" set gcr=a:block-blinkon0
" show status
set laststatus=2

" code folding
" set foldmethod=indent
set foldmethod=syntax
" auto start code folding
set nofoldenable

" block from linux custom begins
" do not display nonreadable chars
set nolist
" display coordinate info
set ruler
" display command info
set showcmd
" highlight the current line
set cursorline
" set cursorcolumn
" quick jump to the matched parenthesis
" set showmatch
" highlight the unmatched parenthesis
let loaded_matchparen=1

" set indent configs
filetype indent on
set tabstop=4
set cindent shiftwidth=4
set autoindent shiftwidth=4
set smartindent shiftwidth=4
set expandtab
" clear multiple blanks
set softtabstop=4

" highlight the matched pattern
set hlsearch
" block from linux custom ends

" block from linux custom begins
" find the lines with blanks at end (fs -> find space)
map <leader>fs :/.*\s\+$<CR>
" delete the blanks at the line end (res -> remove end space)
map <leader>res :s#\s\+$##<CR>
" block from linux custom ends

" no highlight
map <Leader>nh :nohl<CR>

" shortcuts for line begining and end nmap lb ^
nmap lb ^
nmap le $
" copy to X buffers
vnoremap <Leader>y "+y
" paste from X buffers
nmap <Leader>p "+p
" exit current window
nmap <Leader>q :q<CR>
" save current window
nmap <Leader>w :w<CR>
" save all window and exit vim
nmap <Leader>WQ :wa<CR>:q<CR>
" force to quit vim
nmap <Leader>Q :qa!<CR>
" next window
nnoremap <Leader>nw <C-W><C-W>
" jump to the right window
nnoremap <Leader>lw <C-W>l
" jump to the left window
nnoremap <Leader>hw <C-W>h
" jump to the upper window
nnoremap <Leader>kw <C-W>k
" jump to the lower window
nnoremap <Leader>jw <C-W>j
" jump between pairs of parenthesiss
" pa -> pair
nmap <Leader>pa %
" jump to next word
nmap <Leader>n *
" jump to previous word
nmap <Leader>p #

" turn on real-time search
set incsearch
" get case insensitive during search
set ignorecase
" turn of compatible mode
set nocompatible
" smart complete
set wildmenu

" specify path for pathogen
runtime bundle/pathogen/autoload/pathogen.vim
" run pathogen
execute pathogen#infect()

" skip parenthesiss
func SkipPair()  
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}' || getline('.')[col('.') - 1] == '>'  
        return "\<ESC>la"  
    else  
        return "\t"  
    endif  
endfunc  
inoremap <Leader>a <c-r>=SkipPair()<CR>

" auto start visual indent
let g:indent_guides_enable_on_vim_startup=0
" in level 2
let g:indent_guides_start_level=2
" width of the color
let g:indent_guides_guide_size=1
" switch of visualization
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" switch between .cpp and .h
nmap <Leader>ch :A<CR>
" show .cpp or .h in subwindow
nmap <Leader>sch :AS<CR>

" configs for vim-signature
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

" traverse the named tags
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>

" set ctags options for indexer
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" set ycm
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>

" display tagbar at left
let tagbar_left=1 
" display/hide tagbar (ts -> tag list)
nnoremap <Leader>tl :TagbarToggle<CR> 
" set tagbar width
let tagbar_width=32 
" set compact display
let g:tagbar_compact=1
" settings of ctags
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" shortcut for search in project (sp -> search in project)
nnoremap <Leader>sp :CtrlSF<CR>

" function to replace. args:
" confirm: whether to confirm before replacement
" wholeword: to match wholeword
" replace: string to replace
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" no confirm, not wholeword
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" not confirm, wholeword
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" confirm, not wholeword
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" confirm and wholeword
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" code template
let g:UltiSnipsSnippetDirectories=["mysnippets"] 
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" smart completion
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
set tags+=/usr/include/c++/4.8/stdcpp.tags

" color theme for YcmCompleter
" menu
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" items
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" for comment
let g:ycm_complete_in_comments=1
" autoload the .ycm_extra_conf
let g:ycm_confirm_extra_conf=0
" turn on the tags completion engine
let g:ycm_collect_identifiers_from_tags_files=1
" include the c++ standard tags
" set tags+=/data/misc/software/misc./vim/stdcpp.tags
" include OmniCppComplete and setup the shortcut
inoremap <leader>; <C-x><C-o>
" only display the completion menu
set completeopt-=preview
" start completion upon the first char
let g:ycm_min_num_of_chars_for_completion=1
" no cache
let g:ycm_cache_omnifunc=0
" syntax key word         
let g:ycm_seed_identifiers_with_syntax=1

" set the path for pullproto.pl
let g:protodefprotogetter='~/.vim/bundle/protodef/pullproto.pl'
let g:disable_protodef_sorting=1

" set up man cmd
source $VIMRUNTIME/ftplugin/man.vim
" define shortcut for man
nmap <Leader>man :Man 3 <cword><CR>

" use NERDTree. fl -> file list
nmap <Leader>fl :NERDTreeToggle<CR>
" set window width
let NERDTreeWinSize=32
" set window position
let NERDTreeWinPos="right"
" display hidden file
let NERDTreeShowHidden=0
" no redundant info
let NERDTreeMinimalUI=1
" remove buffer
let NERDTreeAutoDeleteBuffer=1

" show/hide MiniBufExplorer window
map <Leader>bl :MBEToggle<cr>
" shortcut for switch
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

" setup for environment saving
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" save undo history
set undodir=~/.undo_history/
set undofile
" shortcut for saving environment
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" shortcut for restoring environment
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>

" shortcut for one-key compile
nmap <Leader>m :!rm -rf main<CR>:wa<CR>:make<CR><CR>:cw<CR>
" shortcut for one-key run
nmap <Leader>g :!rm -rf main<CR>:wa<CR>:make<CR>:cw<CR><CR>:!./main<CR>

" deploy the gundo tree
nnoremap <Leader>ud :GundoToggle<CR>

" shortcut for header guards
map <Leader>ah :HeaderguardAdd<cr>

" suppress ValueError warning from ycm
set shortmess=a
" get rid of Press Enter to continue
set cmdheight=2

" setup for DoxygenToolKit
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Xiaoya Wei"
let g:DoxygenToolkit_licenseTag="General Public License v3.0"
" let g:DoxygenToolkit_commentType = "C++"

" shortcuts for DoxygenToolKit
map <Leader>da :DoxAuthor<cr>
map <Leader>dl :DoxLic<cr>
map <Leader>dd :Dox<cr>
map <Leader>db :DoxBlock<cr>
