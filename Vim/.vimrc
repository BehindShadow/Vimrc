"设置编码方式，支持中文"
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


" 设置当前行(CursorLine)的外观样式
hi CursorLine term=bold cterm=bold ctermbg=241

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

set scrolloff=6     " 光标移动到buffer的顶部和底部时保持5行距离

" 映射全选+复制 ctrl+a
map <C-A> ggVG"+Y
map! <C-A> <Esc>ggVG"+Y

" 自映射复制到+寄存器
let mapleader=" "
map <LEADER>p "+p
map <LEADER>y "+y
map <LEADER>yy "+yy


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

"从不备份  
set nobackup
"不要使用vi的键盘模式，而是vim自己的
set nocompatible 


"更改光标样式
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)


"括号匹配时的颜色修改
hi MatchParen ctermbg=Red guibg=AliceBlue

" 导入一个默认的配色方案
colorscheme desert

