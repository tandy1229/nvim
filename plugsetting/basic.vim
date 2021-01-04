" >>> EDITED SETUP
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
filetype plugin on
filetype indent on
set number           " 显示行号
set notimeout
set ttimeoutlen=0    " 无延迟
set encoding=utf-8
set ff=unix
set visualbell
set relativenumber   " 显示相对行号
set noshowmode
set showcmd          " 显示输入的命令
set tabstop=2
set shiftwidth=2
set softtabstop=2
set hidden           " 切换文件不保存，隐藏
set autoindent       " 换行时自动缩进
set smartindent
set expandtab        " 将tab转为空格
set smarttab
set ignorecase       " 设置忽略大小写
set smartcase        " 设置智能识别大小写
set wildmenu         " 命令行补全
set wildmode=full
set wrap             " 自动折行
set linebreak        " 折行时不会将单词分开
set foldenable       " 折叠
set foldlevel=99     " 相当于默认不折叠
set indentexpr=      " 禁用vim缩进indent
set scrolloff=5
set shortmess+=c     " 减少错误信息
set inccommand=split " Also shows partial off-screen results in a preview window.
set list             " 显示不可见字符
set listchars=tab:\|\ ,trail:▫
set lazyredraw
set updatetime=100
set virtualedit=block
set autowrite
set autoread
au FocusGained,BufEnter * checktime
set splitbelow
set splitright
set colorcolumn=100
set viewoptions=cursor,folds,slash,unix " viminfo 记录的内容
set completeopt=longest,noinsert,menuone,noselect,preview
" set clipboard=unnamed " in macos it's unneeded

let $LANG='en'
set langmenu=en

" 某种备份
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo,.
endif

" 记住前一次退出的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" >>> terminal settings
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" 渲染百万色
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>

" >>> 自定义按键布局
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

" <leader>
let mapleader=" "

" Quit
noremap <silent> S :update<CR>
noremap Q :q<CR>
nnoremap <silent><Leader>q :q<cr>
nnoremap <silent><Leader>Q :qa!<cr>
inoremap <silent><C-Q> <esc>:q<cr>
nnoremap <silent><C-Q> :q<cr>
vnoremap <silent><C-Q> <esc>

" Faster in-line navigation
noremap W 5w
noremap B 5b

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

" buffer
nnoremap <M-k> :bn<CR>
nnoremap <M-j> :bp<CR>
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>

" tab
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
nnoremap ]t :tabn<CR>
nnoremap [t :tabp<CR>

" Indentation
nnoremap < <<
nnoremap > >>
noremap - N
noremap = n

" select all
nnoremap <Leader>sa ggVG

" yank
" make Y to copy till the end of the line
nnoremap Y y$
" Copy to system clipboard
vnoremap Y "+y

noremap s <nop>
noremap ` ~

" Space to Tab
nnoremap <LEADER>st :%s/  /\t/g
vnoremap <LEADER>st :s/  /\t/g
nnoremap <LEADER>tt :%s/\t/  /g

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" find and replace
noremap \s :%s//g<left><left>

" Folding
noremap <silent> <LEADER>o za

" set not hlsearch after '/'
noremap <LEADER>n :nohlsearch<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Compile function
noremap <silent> \r :call CompileRun()<CR>
func! CompileRun()
  silent! exec "update"
  if &filetype == 'c'
    set splitbelow
    :sp
    :term cc % -o %< && time ./%<
  elseif &filetype == 'cpp'
    set splitbelow
    :sp
    :res -5
    :term g++ -std=c++11 % -Wall -o %< && time ./%<
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    set splitbelow
    :sp
    :res -5
    :term time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
  elseif &filetype == 'markdown'
    silent! exec "MarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'dart'
    exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:fltter_run_args
    silent! exec "CocCommand flutter.dev.openDevLog"
  elseif &filetype == 'perl'
    set splitbelow
    :sp
    :term perl -w %
  elseif &filetype == 'javascript'
    set splitbelow
    :sp
    :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run .
  elseif &filetype == 'php'
    set splitbelow
    :sp
    :term php %
  endif
endfunc

" >>> autocmd
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" autocmd BufRead,BufNewFile *.md setlocal spell  " set spell in markdown
autocmd InsertLeave,WinEnter * set cursorline   " perform beautifully
autocmd InsertEnter,WinLeave * set nocursorline
autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd BufEnter * silent! lcd %:p:h            " Auto change directory to current dir

" Automatically deletes all trailing whitespace and newlines at end of file on save.
" >>>>>>>>> now I use a function to do this. Due to some file actually needs whitespace in the end of the line.
" autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritePre * %s/\n\+\%$//e

" del extra whitespace
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    silent! %s/\n\+\%$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

command! -nargs=0 CleanExtraSpaces :call CleanExtraSpaces()

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" press f10 to show hlgroup
function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" open init.vim anytime
noremap <LEADER>rc :e ~/.config/nvim/plugsetting/plugins_config.vim<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
