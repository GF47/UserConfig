" 配置立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC


"--------------------------------------------------------------"
" 行为
"--------------------------------------------------------------"

" 不兼容模式
set nocompatible
" 移动时是否换行，b-backspace，s-space，h-h键，l-l键，<-Normal和Visualo模式的左，>-右，[-Insert和Replace模式的左，]-右
set whichwrap+=<,>,h,l
" 退格键删除缩进，上一行行尾，插入模式开始时光标所在位置之前的字符
set backspace=indent,eol,start
" 光标移动到底部或顶部保持指定距离
set scrolloff=2
" 自身命令行模式智能补全
set wildmenu
" 取消alt键呼出菜单的功能
set winaltkeys=no
" 鼠标一直enable
set mouse=a
set selectmode=
set mousemodel=popup
set keymodel=
set selection=inclusive


"--------------------------------------------------------------"
" 查找和匹配
"--------------------------------------------------------------"

" 忽略大小写
set ignorecase
" 开启高亮显示搜索结果
set hlsearch "hls
" 括号配对显示
set showmatch "sm


"--------------------------------------------------------------"
" 文件相关
"--------------------------------------------------------------"

" 开启特定类型文件的缩进方式和相关插件
filetype indent plugin on
" 自动将当前文件所在的目录设置为当前目录
set autochdir
" 文件在外部被改动时自动加载
set autoread
" 不使用备份
set nobackup
set noswapfile


"--------------------------------------------------------------"
" 语言和编码
"--------------------------------------------------------------"

" 无bom头
set nobomb
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set langmenu=zh_CN.UTF-8
" let $LANG='en_US.UTF-8'
language message zh_CN.UTF-8
if version >= 603
    set helplang=cn
endif
" 终端字符编码方式
set termencoding=utf-8
" filetypes
set ffs=unix,dos,mac

nmap <leader>fu :set ff=unix<cr>
nmap <leader>fd :set ff=dos<cr>
nmap <leader>fm :set ff=mac<cr>


"--------------------------------------------------------------"
" 格式
"--------------------------------------------------------------"

" C/C++风格的自动缩进
set cindent "cin
" cindent缩进的格式
set cino=:0g0t0(susj1
" 回车后是否自动缩进，当文件不是C/C++文件时，可以做到类似排版风格
set autoindent "ai
" 貌似是autoindent的加强版，分不大清楚:(
set smartindent "si
" <<和>>操作时缩进的列数
set shiftwidth=4 "sw
" tab字符的列数
set tabstop=4 "ts
" 一次tab键实际占用的列数
" 如果tabstop=4，softtabstop=5，则按一个tab键等于输入了一个tab字符加一个空格字符
" 若tabstop=8，softtabstop=3，则按一个tab键等于输入了三个空格字符，按两个tab键加两个空格等于输入了一个tab字符
set softtabstop=4 "sts
" 用空格字符替换tab字符，:retab!可以将文件中的tab字符转换为空格
set expandtab "et
" 退格键删除被空格替换的tab时，删除4个空格
set smarttab "st
" 关键字上色
syntax enable
syntax on


"--------------------------------------------------------------"
" GUI
"--------------------------------------------------------------"

" 乌干达儿童……
autocmd GUIEnter * set shortmess=atI
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 显示行号
set number! "nu
" 底部显示状态栏标尺
set ruler "ru
" 设置命令行高度
set cmdheight=2
" 不显示空白字符
set nolist
" 行列字符数
set lines=24 columns=118
" 行间距
set linespace=8
" 不在单词中间断行
set lbr
" Unicode中双字节字符宽度
set ambiwidth=double
" 亚洲字符断行，m为允许在两个汉字之间断行，B为将两行合并时，汉字之间不需要补空格
set fo+=mB
" 带以下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 启动时关闭折叠
set nofoldenable
" 折叠类型
set foldmethod=indent
if has("gui_running")
	colo torte
	set nowrap
    " 隐藏工具栏
    set guioptions-=T
    " 隐藏菜单栏
    set guioptions-=m
    set guioptions-=L
    " 右滚动条
    set guioptions-=r
    " 底部滚动条
    set guioptions+=b
    " 内置tab样式，删掉gui样式
    set guioptions-=e
else
	colo ron
	set wrap
endif
" 配色
hi Folded term=standout ctermfg=darkcyan ctermbg=NONE guifg=Black guibg=#e3c1a5
" 弹窗配色
hi PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
hi PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
" 禁止光标闪烁
" set gcr=a:block-blinkon0
" 显示光标所在的行
set cursorline "cul
if has("gui_running")
    hi cursorline guibg=#001420
    hi CursorColumn guibg=#001420
endif
" 字体
if (has("win32") || has("win64"))
	if(has("gui_running"))
		set guifont=Consolas:h12:cANSI
	endif
else
	if(has("gui_running"))
		set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
	endif
endif


"--------------------------------------------------------------"
" 音效
"--------------------------------------------------------------"
" 错误提示音
set noerrorbells "noeb
set novisualbell
set t_vb=


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

nmap <leader>cg :call AddTitle()<cr> 's


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
Plugin 'othree/xml.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'leafgarland/typescript-vim'
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

" nerdcommenter
let g:NERDSpaceDelims=1

" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_disable_for_files_larger_than_kb = 1000
set completeopt=menu,menuone

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

" let g:ycm_filetype_whitelist = {
    " \ "c":1,
    " \ "cpp":1,
    " \ "objc":1,
    " \ "objcpp":1,
    " \ "cuda":1,
    " \ "cs":1,
    " \ "python":1,
    " \ "lua":1,
    " \ "go":1,
    " \ "java":1,
    " \ "javascript":1,
    " \ "typescript":1,
    " \}
