"
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    __  ____   __         __     _____ __  __ ____   ____    "
"   |  \/  \ \ / /         \ \   / /_ _|  \/  |  _ \ / ___|   "
"   | |\/| |\ V /   _____   \ \ / / | || |\/| | |_) | |       "
"   | |  | | | |   |_____|   \ V /  | || |  | |  _ <| |___    "
"   |_|  |_| |_|              \_/  |___|_|  |_|_| \_\\____|   "
"                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
"
"  author: @tandy1229 
"  modifiy from @theniceboy
"  
"  the awesome vimrc
"
"
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> EDITER SETUP
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

" 渲染百万色
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" <leader>
let mapleader=","

set number         " 显示行号
set relativenumber " 显示相对行号
set cursorline     " 高亮光标所在的行和列
set hidden         " 切换文件不保存，隐藏
" tab的补全长度
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab         " 将tab转为空格
set nocompatible      " 不兼容vi
set ignorecase        " 设置忽略大小写
set smartcase         " 设置智能识别大小写
                      " set numberwidth=4  设置行号列宽
set wrap              " 自动折行
set ttimeoutlen=0     " 无延迟
set notimeout
set foldenable        " 折叠
set foldmethod=indent " 代码折叠
set foldlevel=99      " 相当于默认不折叠
set indentexpr=       " 禁用vim缩进indent
set autoindent        " 换行时自动缩进
set history=200       " 存储的历史记录

set viewoptions=cursor,folds,slash,unix " viminfo 记录的内容
set scrolloff=5
set completeopt=longest,noinsert,menuone,noselect,preview
set showcmd      " 显示输入的命令
set wildmenu     " 命令行补全
set ttyfast      " 滚动快？？？？！
set splitright
set splitbelow
set shortmess+=c " 减少错误信息
set inccommand=split
" set list
" set listchars=tab:\|\ ,trail:▫

set lazyredraw
set visualbell
set list         " 显示不可见字符

" 某种备份
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.onfig/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block

" 记住前一次退出的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> 自定义按键布局
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

noremap S :w<CR>
noremap Q :q<CR>

noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l

" 分屏
noremap sh :set splitright<CR>:vsplit<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>
noremap sj :set nosplitbelow<CR>:split<CR>
noremap sk :set splitbelow<CR>:split<CR>


" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>


" Indentation
nnoremap < <<
nnoremap > >>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" open lazygit
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>


" ===
" === Searching
" ===
noremap - N
noremap = n

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>


" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:fltter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc
