set number
set colorcolumn=81
set tags=tags,./tags,.,..

:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set expandtab

:set autoindent 

func SkipPair()  
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}' || getline('.')[col('.') - 1] == '>'  
        return "\<ESC>la"  
    else  
        return "\t"  
    endif  
endfunc  
inoremap <TAB> <c-r>=SkipPair()<CR>
