"""""""""""""""""""""""""""""""""""""""""""基本设置"""""""""""""""""""""""""""""""""""""""""""""
filetype on	"开启文件类型侦测
filetype indent on	"适应不同语言的缩进
syntax enable	"开启语法高亮功能
syntax on 	"允许使用用户配色
autocmd VimEnter * NERDTree "自动打开 NERDTree

"""""""""""""""""""""""""""""""""""""""""""显示设置"""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2        	"总是显示状态栏
set ruler               	"显示光标位置
set number              	"显示行号
set cursorline          	"高亮显示当前行
set cursorcolumn            "高亮显示当前列
set hlsearch                " 高亮搜索结果
exec "nohlsearch"
set incsearch               "边输边高亮
set ignorecase              "搜索时忽略大小写
set smartcase

set relativenumber          "其他行显示相对行号
"set scrolloff=5            "垂直滚动时光标距底部位置


"""""""""""""""""""""""""""""""""""""""""""编码设置"""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936    " 检测文件编码,将fileencoding设置为最终编码
set fileencoding=utf-8                              " 保存时的文件编码
set termencoding=utf-8                              " 终端的输出字符编码
set encoding=utf-8                                  " VIM打开文件使用的内部编码


"""""""""""""""""""""""""""""""""""""""""""编辑设置"""""""""""""""""""""""""""""""""""""""""""""
set expandtab   	"扩展制表符为空格
set tabstop=4   	"制表符占空格数
set softtabstop=4	"将连续数量的空格视为一个制表符
set shiftwidth=4	"自动缩进所使用的空格数
"set textwidth=79	"编辑器每行字符数
set wrap            "设置自动折行
set linebreak       "防止单词内部折行
set wrapmargin=5      "指定折行处与右边缘空格数
set autoindent  	"打开自动缩进
set wildmenu    	"vim命令自动补全


"""""""""""""""""""""""""""""""""按键映射(just for colemak user)"""""""""""""""""""""""""""""""

"      ^    
"      i    
" < j     l >
"      k    
"      v    

"插入模式下的退出键
inoremap tt <Esc>

" 方向键
noremap j h
noremap i k
noremap k j
noremap l l
noremap J 7h
noremap I 5k
noremap K 5j
noremap L 7l

" 跳至行首/行尾
noremap <C-j> 0
noremap <C-l> $

"修改插入模式按键
noremap h i
noremap H I

"修改撤回键
noremap e u

"基础按键映射
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map ; :
nmap 5 %

noremap sj :set splitright<CR>:vsplit<CR>
noremap si :set nosplitright<CR>:vsplit<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sl :set splitbelow<CR>:split<CR>

"切换窗口
let mapleader = "\<Space>"
map <LEADER>l <C-w>l
map <LEADER>i <C-w>k
map <LEADER>j <C-w>h
map <LEADER>k <C-w>j

"map <up> :res +5<CR>
"map <down> :res -5<CR>
"map <left> :vertical -5<CR>
"map <right> :vertical +5<CR>

"切换页面
noremap ti :tabe<CR>
noremap tj :-tabnext<CR>
noremap tl :+tabnext<CR>
noremap tk :close<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

noremap PP :PlugInstall<CR>  "快速配置


""""""""""""""""""""""""""""""""""""""""""""插件设置""""""""""""""""""""""""""""""""""""""""""""

set nocompatible    "关闭兼容模式
filetype off    "文件类型侦测关闭


call plug#begin('~/.vim/plugged')
"需要配置的插件都放在begin和end之间

Plug 'scrooloose/nerdcommenter' "多行注释
Plug 'jiangmiao/auto-pairs'     "括号、引号自动补全
Plug 'ycm-core/YouCompleteMe'   "代码补全
Plug 'scrooloose/nerdtree' 	"树形目录
Plug 'Yggdroot/indentLine'      "自动缩进插件
Plug 'vim-airline/vim-airline'  "状态栏主题
Plug 'vim-scripts/Solarized'    "主题
Plug 'honza/vim-snippets'       "代码片段补全
Plug 'SirVer/ultisnips'
Plug 'jistr/vim-nerdtree-tabs' "文件管理树
Plug 'mhinz/vim-startify'         "vim开始界面最近文件
Plug 'connorholyday/vim-snazzy'   "主题方案
Plug 'ryanoasis/vim-devicons'     "文件图标
Plug 'ryanoasis/vim-devicons'     "文件图标
Plug 'Lokaltog/vim-powerline'     "状态栏主题



call plug#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"solarized
set background=dark
"colorscheme solarized   "素雅
"hi Normal ctermbg=none "设置背景透明

"vim-airline
let g:airline_powerline_fonts=1


"Lokaltog
"let g:Powerline_colorscheme='solarized256'  "设置状态栏主题风格

"nerdtree
"autocmd vimenter * NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25
let NERDTreeWinPos="right"

"indentLine
let g:indentLine_char='┆'       "缩进指示线符       
let g:indentLine_enabled = 1    "开启缩进指示

"YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
  \   'cs,lua,javascript': ['re!\w{2}'],
  \ }
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0


"Snippet
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/vim-snippets/UltiSnips']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

"YouCompleteMe和Snippet的快捷键会冲突
"使用下面的函数让YouCompleteMe和Snippet和平相处

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction

if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif
if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

