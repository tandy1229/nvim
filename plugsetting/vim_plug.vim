silent! if plug#begin('~/.config/nvim/plugged')
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' } " to test the neovim open time

" now I use airline, it has the great-capability with many plugin
Plug 'vim-airline/vim-airline'
Plug 'tandy1229/airline-deus'
Plug 'ojroques/vim-scrollstatus'

" FZF ---- the plug I love best!!!
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' } " 模糊搜索
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }  " Find & Replace

" coc awesome complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

" autoformat
Plug 'google/vim-maktaba', {'on': 'FormatCode'}
Plug 'google/vim-codefmt', {'on': 'FormatCode'}

" markdown
Plug 'tpope/vim-markdown', {'for': 'markdown'}
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim' " 自动化插件
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }

" 代码主题
Plug 'tandy1229/nvim-deus'
" Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'         " 彩虹括号哦
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'


" python
Plug 'python-mode/python-mode', { 'for' :[ 'python', 'vim-plug' ] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :[ 'python', 'vim-plug' ] } " python高亮
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :[ 'python', 'vim-plug' ] }
Plug 'tweekmonster/braceless.vim', { 'for' :[ 'python', 'vim-plug' ] }

" go
Plug 'fatih/vim-go' , { 'for': [ 'go', 'vim-plug' ], 'tag': '*' }

" tex
Plug 'lervag/vimtex'

" html && css && js
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
Plug 'yuezk/vim-js', { 'for': [ 'vim-plug', 'php', 'html', 'javascript', 'css', 'less' ] }
Plug 'mattn/emmet-vim', { 'for': [ 'vim-plug', 'html', 'css', 'less' ] }

" snippets
Plug 'honza/vim-snippets'

" 进入动画？
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'liuchengxu/vista.vim'
Plug 'pechorin/any-jump.vim'
Plug 'kevinhwang91/rnvimr', { 'on': 'RnvimrToggle' }

" git diff
Plug 'cohama/agit.vim', { 'on': 'Agit' }
Plug 'tpope/vim-fugitive' " use in git
Plug 'fszymanski/fzf-gitignore', { 'on': 'FzfGitignore' }
Plug 'kdheepak/lazygit.nvim', { 'on': 'LazyGit' }
Plug 'tpope/vim-rhubarb'
Plug 'rhysd/git-messenger.vim'

" 对齐文本
Plug 'godlygeek/tabular', { 'on': 'Tabularize' } " use visualmode ga
Plug 'junegunn/vim-easy-align'                   " I need to pratice

" useful plug
Plug 'tpope/vim-surround'                        " 改括号
Plug 'AndrewRadev/splitjoin.vim'                 " 一行代码变多行
Plug 'rhysd/clever-f.vim'                        " f不能用；
Plug 'wincent/terminus'                          " 鼠标支持
Plug 'airblade/vim-rooter'                       " ???
Plug 'svermeulen/vim-subversive'                 " 替换:s/的升级版
Plug 'mg979/vim-visual-multi'                    " 多括号
Plug 'gcmt/wildfire.vim'                         " 超级回车
Plug 'junegunn/vim-peekaboo'                     " yank
Plug 'theniceboy/antovim'                        " gs to switch
Plug 'RRethy/vim-illuminate'                     " 高亮相同单词
Plug 'tpope/vim-commentary'                      " 注释插件
Plug 'tpope/vim-abolish'

" focus mode
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

" writting
Plug 'ron89/thesaurus_query.vim'

" async
Plug 'skywind3000/asyncrun.vim', { 'on': 'AsyncRun' }
Plug 'skywind3000/asynctasks.vim'

" debugger
Plug 'puremourning/vimspector'

" Chinese vim document
Plug 'yianwillis/vimcdoc'
call plug#end()
endif
