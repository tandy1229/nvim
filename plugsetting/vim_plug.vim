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

" ================================
" ========= vim-plug =============
" ================================
"
"
"
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }


" FZF
" the plug I love best!!!
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension', 'on': 'LeaderfFile' } " 模糊搜索


" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }


" markdown
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim' " 自动化插件
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }


"
" 超好看的状态栏
" now I use airline, it has the great-capability on many platflot
Plug 'vim-airline/vim-airline'
Plug 'tandy1229/vim-airline-themes'
Plug 'ojroques/vim-scrollstatus'
" another tabline
" Plug 'theniceboy/eleline.vim'
" Plug 'liuchengxu/eleline.vim'
" Plug 'mg979/vim-xtabline'
" Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'


" 代码主题
" Plug 'morhetz/gruvbox'
" cw dalao's beautiful theme
Plug 'theniceboy/nvim-deus'


" rager: the document arragement
Plug 'kevinhwang91/rnvimr', { 'on': 'RnvimrToggle' }
Plug 'pechorin/any-jump.vim'


" python
Plug 'python-mode/python-mode', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] } " python高亮
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }


" go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }


" html && css && js
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }

" beautiful vim 
Plug 'ryanoasis/vim-devicons'


" 检查语法错误
" now have coc.nvim
" Plug 'scrooloose/syntastic'
" Plug 'neomake/neomake'
" Plug 'w0rp/ale'


" 语法树
" see the funtion
Plug 'liuchengxu/vista.vim'


" 进入动画？
" vim-little-program
Plug 'mhinz/vim-startify'


" 新式文件树
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons', { 'on': 'Defx' }
Plug 'kristijanhusak/defx-git', { 'on': 'Defx' }


Plug 'neoclide/coc.nvim', {'branch': 'release'}


" 撤销树
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }


" git diff
Plug 'cohama/agit.vim', { 'on': 'Agit' }
Plug 'tpope/vim-fugitive' " use in git
Plug 'airblade/vim-gitgutter'
Plug 'fszymanski/fzf-gitignore'


" 对齐文本
Plug 'godlygeek/tabular', { 'on': 'Tabularize' } " use visualmode ga 
Plug 'junegunn/vim-easy-align' " I need to pratice


" useful plug
Plug 'itchyny/vim-cursorword'    " 高亮相同的单词
Plug 'jiangmiao/auto-pairs'      " 补全括号
Plug 'luochen1990/rainbow'       " 彩虹括号哦
Plug 'tpope/vim-surround'        " 改括号
Plug 'AndrewRadev/splitjoin.vim' " 一行代码变多行
" Plug 'Yggdroot/indentLine'     " 细线显示缩进
Plug 'rhysd/clever-f.vim'        " f不能用；
Plug 'wincent/terminus'          " 鼠标支持
Plug 'airblade/vim-rooter'       " ???
Plug 'svermeulen/vim-subversive' " 替换:s/的升级版
Plug 'mg979/vim-visual-multi'    " 多括号
Plug 'gcmt/wildfire.vim'         " 超级回车
Plug 'junegunn/vim-peekaboo'     " yank
" Plug 'easymotion/vim-easymotion' " find


" focus mode
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }


" 注释插件
Plug 'tpope/vim-commentary'
" Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line


" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'


" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSpdate'}
Plug 'nvim-treesitter/playground'


Plug 'skywind3000/asyncrun.vim', { 'on': 'AsyncRun' }
Plug 'skywind3000/asynctasks.vim'


" useful snnipets
Plug 'honza/vim-snippets'

" Chinese vim document
Plug 'yianwillis/vimcdoc'

call plug#end()
