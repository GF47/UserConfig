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
" 允许下方显示目录
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

function SetTab2()
    set shiftwidth=2
    set tabstop=2
    set softtabstop=2
endfunction

function SetTab4()
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
endfunction

"--------------------------------------------------------------"
" GUI
"--------------------------------------------------------------"

" 乌干达儿童……
autocmd GUIEnter * set shortmess=atI
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set laststatus=2
set t_Co=256
" 显示行号
set number! "nu
" 底部显示状态栏标尺
set ruler "ru
set statusline=                   " 清空状态栏
set statusline+=\ %F              " 文件名
set statusline+=\ [%1*%M%*%n%R%H] " buffer 编号 状态
set statusline+=%=                " 右对齐
set statusline+=\ %y              " 文件类型
" 最右边显示文件编码和行号等信息
set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)
" 设置命令行高度
set cmdheight=2
" 不显示空白字符
set nolist
" 行列字符数
" set lines=24 columns=118
" 行间距
set linespace=8
" 不在单词中间断行
set lbr
" Unicode中双字节字符宽度
set ambiwidth=double
" 亚洲字符断行，m为允许在两个汉字之间断行，B为将两行合并时，汉字之间不需要补空格
set formatoptions+=mB
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


hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! clear SpellLocal
if has('gui_running')
    hi! SpellBad gui=undercurl guisp=red
    hi! SpellCap gui=undercurl guisp=blue
    hi! SpellRare gui=undercurl guisp=magenta
    hi! SpellRare gui=undercurl guisp=cyan
else
    hi! SpellBad term=standout ctermfg=1 term=underline cterm=underline
    hi! SpellCap term=underline cterm=underline
    hi! SpellRare term=underline cterm=underline
    hi! SpellLocal term=underline cterm=underline
endif
" 配色
hi Folded term=standout ctermfg=darkcyan ctermbg=NONE guifg=Black guibg=#e3c1a5
" 弹窗配色
hi PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
hi PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
" 禁止光标闪烁
" set gcr=a:block-blinkon0
" 显示光标所在的行
if has("gui_running")
    set cursorline "cul
    hi cursorline guibg=#001420
    hi CursorColumn guibg=#001420
endif
" 字体
if has("gui_running")
    if has("win32") || has("win64")
        set guifont=Consolas:h12:cANSI
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
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
" ctags
"--------------------------------------------------------------"
set tags=./.tags;,.tags

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

" 系统剪切板交互，wsl的无奈之举
" paste.exe在windows里是没有的，自己写个控制台程序输出剪切板内容吧- -!最好用win32原生的api，不然大概率有延迟
vmap <leader><leader>y :'<,'>w !clip.exe<cr><cr>
nmap <leader><leader>p :read !paste.exe<cr>


"--------------------------------------------------------------"
" vim-plug
"
" 说明：
" 1.保证windows下的git和mingw可以正确加载插件
"   以及linux下可以正确加载
"   在`.vim`文件夹中新建`autoload`文件夹
"   将`plug.vim`拷贝进去
" 2.仅限windows下的gvim和其命令行版
"   在`.vim`文件夹外新建`vimfiles\autoload`文件夹
"   将`plug.vim`拷贝进去
"
" 所以在windows下，其实是有两个`plug.vim`文件的
" 只不过gvim和git自带的vim加载的不是一个而已
"--------------------------------------------------------------"

call plug#begin(expand('$HOME/.vim/vim-plug/bundle'))
" 添加需要加载的插件↓
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/taglist.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/winmanager'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'othree/xml.vim'
Plug 'scrooloose/nerdcommenter'
" Plug 'Valloric/YouCompleteMe'
Plug 'iamcco/dict.vim'
Plug 'vim-scripts/DrawIt'
" 添加需要加载的插件↑

call plug#end()


"--------------------------------------------------------------"
" 插件配置
"--------------------------------------------------------------"

" airline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_powerline_fonts = 0
let g:airline_exclude_preview = 1
let g:airline_section_b = '%n'
let g:airline_theme='deus'
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 0
let g:airline#extensions#csv#enabled = 0
let g:airline#extensions#vimagit#enabled = 0


" TagList & NERDTree
if has("windows")                                                        " 这里也是为了适配windows的ctags
    if has("win32") || has("win64")                                      " linux下ctags无需配置
        let Tlist_Ctags_Cmd = '"D:\GF47_Program_Files\ctags\ctags.exe"'  " gvim加载ctags为左边的路径
    else                                                                 "
        let Tlist_Ctags_Cmd = '/d/GF47_Program_Files/ctags/ctags'        " git和mingw加载ctags为左边的路径
    endif                                                                "
endif                                                                    "
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

" " YouCompleteMe
" " 停止提示是否加载本目录下的ycm_extra_conf文件
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_server_log_level = 'info'
" " 第二个字符触发补全
" let g:ycm_min_num_identifier_candidate_chars = 2
" " 在字符串和注释中的文字也会被收入补全
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" " 字符串中使用补全
" let g:ycm_complete_in_strings=1
" " 注释中使用补全
" let g:ycm_complete_in_comments = 1
" " Ctrl+Z调出补全
" let g:ycm_key_invoke_completion = '<c-z>'
" " 语法关键字补全
" let g:ycm_seed_identifiers_with_syntax = 1
" " 大于1kb的文件不使用补全
" let g:ycm_disable_for_files_larger_than_kb = 1000
" set completeopt=menu,menuone
" 
" let g:ycm_semantic_triggers =  {
"            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"            \ 'cs,lua,javascript': ['re!\w{2}'],
"            \ }
" 
" " let g:ycm_filetype_whitelist = {
"     " \ "c":1,
"     " \ "cpp":1,
"     " \ "objc":1,
"     " \ "objcpp":1,
"     " \ "cuda":1,
"     " \ "cs":1,
"     " \ "python":1,
"     " \ "lua":1,
"     " \ "go":1,
"     " \ "java":1,
"     " \ "javascript":1,
"     " \ "typescript":1,
"     " \}


" dict.vim
let g:api_key = "1932136763"
let g:keyfrom = "aioiyuuko"

nmap <silent> <leader><leader>w <Plug>DictWSearch
vmap <silent> <leader><leader>w <Plug>DictWVSearch
