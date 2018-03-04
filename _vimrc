" 配置立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" vim工作在不兼容模式下
set nocp

" 忽略大小写
set ignorecase

set lines=24
set columns=118

" 行间距
set linespace=8

" 禁止光标闪烁
" set gcr=a:block-blinkon0

if has("gui_running")
    " 禁止显示滚动条
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions+=b
    " 禁止显示菜单和工具条
    " set guioptions-=m
    set guioptions-=T
endif

"Tab related
set ts=4
set sw=4
set smarttab
set et
set ambiwidth=double

"Format related
"set textwidth=78
set lbr
set fo+=mB

"Fold related
"set foldmethod=indent

"Indent related
set cin
set ai
set cino=:0g0t0(susj1

"Editing related
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set mouse=a
set selectmode=
set mousemodel=popup
set keymodel=
set selection=inclusive

" 自身命令行模式智能补全
set wildmenu
"set spell

"Encoding related
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"File type related
filetype plugin indent on

"Display related
set shortmess=atI

set ru
set nu!
set sm
" 开启高亮显示搜索结果
set hls
if(has("gui_running"))
	colo torte
	set nowrap
else
	colo ron
	set wrap
endif
syntax on

" Color in vim
hi Folded term=standout ctermfg=darkcyan ctermbg=NONE guifg=Black guibg=#e3c1a5

" Platform dependent settings
if(has("win32"))
	if(has("gui_running"))
		set guifont=Consolas:h12:cANSI
	endif
else
	if(has("gui_running"))
		set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
	endif
endif

"--------------------------------------------------------------"
" 自定义的一些方法
"--------------------------------------------------------------"

" 文件头
function AddTitle()
    call append(0,"/***************************************************************")
    call append(1," *@File Name     : ".expand("%:t"))
    call append(2," *@Author        : GF47")
    call append(3," *@Description   : TODO what's the use of ".expand("%:t"))
    call append(4," *@Data          : ".strftime("%Y-%m-%d %H:%M"))
    call append(5," *@Edit          : none")
    call append(6," **************************************************************/")
endfunction

nmap <leader>c :call AddTitle()<cr> 's

"--------------------------------------------------------------"
" Vundle
"--------------------------------------------------------------"

"vundle start
set nocompatible " be iMproved, required
filetype off                  " required

" 将Vundle插件的目录添加到gvim的运行时变量中
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
" All of your Plugins must be added before the following line
Plugin 'VundleVim/Vundle.vim'

" 添加需要加载的插件↓
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/winmanager'
Plugin 'junegunn/vim-easy-align'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
" 添加需要加载的插件↑

call vundle#end()            " required
filetype plugin indent on    " required
"vundle end

"--------------------------------------------------------------"
" 插件配置
"--------------------------------------------------------------"

" PowerLine
set laststatus=2
set t_Co=256
let g:PowerLine_symbols='fancy'
set encoding=utf-8

" TagList & NERDTree
let Tlist_Ctags_Cmd = '"D:\GF47_Program_Files\ctags\ctags.exe"'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_Menu = 1
let g:NERDTree_title = 'NERDTree'

function! NERDTree_Start()
    exe 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

" WinManager
let g:winManagerWindowLayout = "NERDTree|TagList"
let g:winManagerWidth = 30

function! WinManagerToggle()
    if !IsWinManagerVisible()
        exe 'WManager'
        exe 'q'
    else
        exe 'WMClose'
    endif
endfunction
 
nmap <leader>w :call WinManagerToggle()<cr>

" EasyAlign

vmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = {'pattern': '#', 'ignore_groups': ['String']}

" AutoPairs
" if !exists('g:AutoPairs')
"   let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '<':'>'}
" end
