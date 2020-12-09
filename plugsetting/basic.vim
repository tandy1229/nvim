" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> EDITER SETUP
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
set ttyfast      " 滚动快？？？？！
set nocompatible      " 不兼容vi
set number         " 显示行号
set relativenumber " 显示相对行号
set cursorline     " 高亮光标所在的行和列
set hidden         " 切换文件不保存，隐藏
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab         " 将tab转为空格
set ignorecase        " 设置忽略大小写
set smartcase         " 设置智能识别大小写
set wrap              " 自动折行
set linebreak         " 折行时不会将单词分开
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
set splitright
set splitbelow
set shortmess+=c " 减少错误信息
set inccommand=split
set list         " 显示不可见字符
set listchars=tab:\|\ ,trail:▫
set lazyredraw
set visualbell

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
set autowrite

" 记住前一次退出的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> termial settings
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

" 渲染百万色
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> 自定义按键布局
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 


" <leader>
let mapleader=" "

noremap ; :

noremap S :w<CR>
noremap Q :q<CR>

" 切屏
noremap ,w <C-w>w
noremap ,h <C-w>h
noremap ,j <C-w>j
noremap ,k <C-w>k
noremap ,l <C-w>l


" 分屏
noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sj :set splitbelow<CR>:split<CR>


" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>


" Create a new tab with tu
noremap tj :tabe<CR>
" Move around tabs with tn and ti
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>


" Indentation
nnoremap < <<
nnoremap > >>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" some personable
noremap - N
noremap = n

" disable the default s key
noremap s <nop>



" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> cursor
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

" K/J keys for 5 times u/e (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

" Faster in-line navigation
noremap W 5w
noremap B 5b




" auto spell in markdown
autocmd BufRead,BufNewFile *.md setlocal spell


" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
noremap tx :r !figlet 

" find and replace
noremap \s :%s//g<left><left>

" press f10 to show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" open init.vim anytime
noremap <LEADER>rc :e ~/.config/nvim/plugsetting/plugins_config.vim<CR>

" open lazygit
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

" Folding
noremap <silent> <LEADER>o za


" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>


" Compile function
noremap \r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
    set splitbelow
    :sp
    :term gcc % -o %< && ./%<
		" exec "!gcc % -o %<"
		" exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!gcc -std=c++11 % -Wall -o %<"
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
