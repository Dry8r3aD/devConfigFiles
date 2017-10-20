" 1.default setting
set nocompatible
set fileencoding=utf-8
set fileencodings=utf-8,cp949,euc-kr
set termencoding=utf-8
set encoding=utf-8
set autoindent
set autowrite
set backspace=indent,eol,start
set cindent
set cinoptions=:0,g0,0,l1,t0
set history=1000
set hlsearch
set incsearch
set laststatus=2
set magic
set mouse=a
set nobackup
set noerrorbells
set nowrap
set number!
set report=0
set ruler
set scrolloff=5
set selection=exclusive
set showcmd
set showmatch
set showmode
set sidescrolloff=5
set smartcase
set smartindent
set startofline
set softtabstop=0
set title
set ttyfast
set wildmenu
set whichwrap=h,l,[,]
set wildmode=longest:full,full
set fdm=marker
set tw=80

" NP팀 코딩 스타일 "
set cino=>4
set noexpandtab
set tabstop=4
set shiftwidth=4


" 마우스로 select를 하였을 떄, Visual mode로 들어가지 않게 함
set mouse-=a

if 1
filetype on
syntax on
set t_Co=256i
endif

" Vundle(Vim Bundle) configuration
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()
	Bundle 'gmarik/vundle'
	Bundle 'tpope/vim-fugitive'
	Bundle 'Lokaltog/vim-easymotion'
	Bundle 'tpope/vim-rails.git'
	Bundle 'L9'
	Bundle 'FuzzyFinder'
	Bundle 'git://git.wincent.com/command-t.git'
	Bundle 'The-NERD-tree'
	Bundle 'taglist.vim'
	Bundle 'AutoComplPop"'
	Bundle 'Source-Explorer-srcexpl.vim'
	Bundle 'vim-airline/vim-airline'

filetype plugin indent on     " required!


" 2.ctag configuration
set tags=./tags,tags;$HOME
set tags=tags,./tags
set exrc
set nobackup

" 3.cscope configuration
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

if 1
map <c-s> :w<CR>
map <c-c> :'a,'b w! ~/tmp/tmp<CR>
map <c-x> :'a,'b w! ~/tmp/tmp<CR> :'a,'b d<CR>
map <c-p> :r ~/tmp/tmp<CR>
map <c-n> <s-*>
map <s-z> :. s/^/\/\/#Comment By HKKim# /<CR>
map <s-c> :. s/^\/\/#Comment By HKKim# //g<CR>
endif

if filereadable("./cscope.out")
    cs add cscope.out
endif

set csverb

if 1
nmap <F3> :tabnew<CR>
endif

if 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
endif


if 0  " WinManager plugin settings
nnoremap <silent> <F4> :WMToggle<CR>
nnoremap <silent> <F5> :FirstExplorerWindow<CR>
nnoremap <silent> <F6> :BottomExplorerWindow<CR>
let winManagerWindowLayout = 'FileExplorer|BufExplorer'
let g:persistentBehaviour = 0
endif

if 1  " taglist plugin settings
nnoremap <silent> <F5> :FirstExplorerWindow<CR>
nnoremap <silent> <F6> :NERDTree<CR>
nnoremap <silent> <F7> :TlistUpdate<CR>
nnoremap <silent> <F8> :Tlist<CR>
nnoremap <silent> <F9> :TlistSync<CR>
endif



let Tlist_Inc_Winwidth = 0
let Tlist_Auto_Open = 1
let Tlist_Process_File_Always = 0
let Tlist_Enable_Fold_Column = 0
let Tlist_Display_Tag_Scope = 0
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Display_Prototype = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1

"let Tlist_Ctags_Cmd = '$HOME/bin/ctags.exe'   "Cygwin-specific option

" OmniCppComplete plugin settings
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 1
let OmniCpp_DisplayMode = 0
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_ShowPrototypeInAbbr = 0
let OmniCpp_ShowAccess = 1
let OmniCpp_DefaultNamespaces = []
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 0
let OmniCpp_SelectFirstItem = 0
let OmniCpp_LocalSearchDecl = 0

" // The switch of the Source Explorer
nmap <F11> :SrcExplToggle<CR>

" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
		\ "_NERD_tree_",
		\ "Source_Explorer",
		\ "[File List]",
		\ "[Buf List]"
		\ ]
" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" // Let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 1

" // Use program 'ctags' with argument '--sort=foldcase -R' to create or
" // update a tags file
" "let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<S-F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<S-F12>"

" // CTree set
let CCTreeEnhancedSymbolProcessing = 1

" bracket autocompletion
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O
autocmd Syntax html,vim inoremap < <lt>><ESC>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function CloseBracket()
    if match(getline(line('.') + 1), '\s*}') < 0
        return "\<CR>}"
    else
        return "\<ESC>j0f}a"
    endif
endf


function QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        " Inserting a quoted quotation mark into the string
        return a:char
    elseif line[col - 1] == a:char
        " Escaping out of the string
        return "\<Right>"
    else
        " Starting a string
        return a:char.a:char."\<ESC>i"
    endif
endf

" 자동으로 공백 지워주는 script
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ‘'
