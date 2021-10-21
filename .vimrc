call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'rip-rip/clang_complete'
Plug 'valloric/youcompleteme'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'

" Initialize plugin system
call plug#end()

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind

"设置编码方式，支持中文"
"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"高亮显示输入命令
set showcmd  

"去掉错误提示音
set noeb

" 在处理未保存或只读文件的时候，弹出确认
set confirm

"显示行号"
set nu
set number

"启用鼠标"
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"显示括号匹配"
set showmatch

" 语法高亮。自动识别代码，使用多种颜色表示
syntax enable
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
"set go=             " 不要图形按钮  

"设置Tab长度为4空格"
set tabstop=4
"设置自动缩进长度为4空格"
set shiftwidth=4
"继承前一行的缩进方式，适用于多行注释"
set autoindent
set cindent
"set smartindent

set scrolloff=5     " 光标移动到buffer的顶部和底部时保持5行距离  
" 映射全选+复制 ctrl+a
map <C-A> ggVG"+Y
map! <C-A> <Esc>ggVG"+Y

let mapleader=" "
map <LEADER>p "+p
map <LEADER>y "+y
map <LEADER>yy "+yy

"列出当前目录文件  
map <F3> :tabnew .<CR>  
"打开树状文件目录  
map <C-F3> \be  

"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
"set hlsearch
"set incsearch


"总是显示状态栏"
set laststatus=2
"显示光标当前位置"
set ruler

"打开文件类型检测" 
filetype plugin indent on
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

"使此配置立即生效"
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"打开文件类型检测" 
filetype plugin indent on
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu


"从不备份  
set nobackup
set nocompatible " 不要使用vi的键盘模式，而是vim自己的

 

" F5编译和运行C程序，C++程序，shell程序，F9 gdb调试
" 请注意，下述代码在windows下使用会报错，需要去掉./这两个字符
"C，C++ 按F5编译运行,注意在c/c++编译需要在同文件下新建input文件作为文件输入
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%< < input"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'py'
		exec "!python %"
		exec "!python %<"
	endif
endfunc

"自动补全,注意这个会和设置paste冲突不知道为什么
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
"自动补全<符号，但是会有bug因为会导致你的代码变成这样：cout<<>>,于是禁用
"inoremap < <><ESC>i
"inoremap > <c-r>=ClosePair('>')<CR>
inoremap { {<CR>}<ESC>O
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction


let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)


