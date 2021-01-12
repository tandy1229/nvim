silent! if plug#begin('~/.config/nvim/plugged')
" now I use eleline, it is easy
Plug 'romgrk/barbar.nvim'
Plug 'tandy1229/nvim-deus'
Plug 'tandy1229/eleline.vim'
Plug 'ojroques/vim-scrollstatus'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'

" show
Plug 'mhinz/vim-startify'
Plug 'itchyny/calendar.vim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-angular'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'romgrk/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()

" coc awesome complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'nvim-lua/lsp-status.nvim'

" FZF ---- the plug I love best!!!
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' } " 模糊搜索
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }  " Find & Replace

" autoformat
Plug 'google/vim-maktaba', {'on': 'FormatCode'}
Plug 'google/vim-codefmt', {'on': 'FormatCode'}

" markdown
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim' " 自动化插件
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }

" R
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

" python
" Plug 'python-mode/python-mode', { 'for': [ 'python', 'vim-plug' ], 'branch': 'develop' }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :[ 'python', 'vim-plug' ] } " python高亮
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :[ 'python', 'vim-plug' ] }
Plug 'tweekmonster/braceless.vim', { 'for' :[ 'python', 'vim-plug' ] }

" language
Plug 'leafo/moonscript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'rust-lang/rust.vim'

" go
Plug 'fatih/vim-go' , { 'for': [ 'go', 'vim-plug' ], 'tag': '*' }

" dart
Plug 'dart-lang/dart-vim-plugin'
Plug 'f-person/pubspec-assist-nvim'

" Swift
Plug 'keith/swift.vim'
Plug 'arzg/vim-swift'

" docker files
Plug 'ekalinin/Dockerfile.vim'

" tex
Plug 'lervag/vimtex', { 'for': [ 'tex', 'vim-plug' ] }

" html && css && js
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag', { 'for': [ 'vim-plug', 'html' ] }
Plug 'yuezk/vim-js', { 'for': [ 'vim-plug', 'php', 'html', 'javascript', 'css', 'less' ] }
Plug 'mattn/emmet-vim', { 'for': [ 'vim-plug', 'html', 'css', 'less' ] }
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'heavenshell/vim-jsdoc'
Plug 'dag/vim-fish'
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
  autocmd! User indentLine doautocmd indentLine Syntax
  let g:indentLine_char = '|'

" macos
Plug 'rizzatti/dash.vim', { 'on': ['Dash', 'DashKeywords'] }

" snippets
Plug 'honza/vim-snippets'

" 进入动画？
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'simnalamburt/vim-mundo'
  nnoremap <F5> :MundoToggle<CR>
  let g:mundo_width = 30
  let g:mundo_preview_bottom = 1
Plug 'liuchengxu/vista.vim'
Plug 'pechorin/any-jump.vim'
Plug 'kevinhwang91/rnvimr', { 'on': 'RnvimrToggle' }

" git diff
Plug 'cohama/agit.vim', { 'on': 'Agit' }
Plug 'tpope/vim-fugitive' " use in git
Plug 'kdheepak/lazygit.nvim', { 'on': 'LazyGit' }
Plug 'tpope/vim-rhubarb'
Plug 'rhysd/git-messenger.vim'
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'junegunn/gv.vim'
  function! s:gv_expand()
    let line = getline('.')
    GV --name-status
    call search('\V'.line, 'c')
    normal! zz
  endfunction
  autocmd! FileType GV nnoremap <buffer> <silent> = :call <sid>gv_expand()<cr>
Plug 'whiteinge/diffconflicts'

" 对齐文本
Plug 'godlygeek/tabular', { 'on': 'Tabularize' } " use visualmode ga
Plug 'junegunn/vim-easy-align'                   " I need to pratice

" useful plug
Plug 'AndrewRadev/splitjoin.vim'                 " 一行代码变多行
Plug 'rhysd/clever-f.vim'                        " f不能用；
Plug 'wincent/terminus'                          " 鼠标支持
Plug 'airblade/vim-rooter'                       " ???
Plug 'svermeulen/vim-subversive'                 " 替换:s/的升级版
Plug 'mg979/vim-visual-multi'                    " 多括号
Plug 'gcmt/wildfire.vim'                         " 超级回车
Plug 'junegunn/vim-peekaboo'                     " yank
Plug 'tandy1229/antovim'                        " gs to switch
Plug 'tpope/vim-surround'                        " 改括号
Plug 'tpope/vim-commentary'                      " 注释插件
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-after-object'
Plug 'psliwka/vim-smoothie'
Plug 'dyng/ctrlsf.vim'
Plug 'romainl/vim-cool'
Plug 'dhruvasagar/vim-zoom'
Plug 'skywind3000/vim-cppman'
" Plug 'vimwiki/vimwiki'
Plug 'chrisbra/NrrwRgn'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'matze/vim-move'
Plug 'wellle/tmux-complete.vim'

" focus mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" writting
Plug 'ron89/thesaurus_query.vim'

" async
Plug 'skywind3000/asyncrun.vim', { 'on': 'AsyncRun' }
Plug 'skywind3000/asynctasks.vim'

" rainbow
Plug 'junegunn/rainbow_parentheses.vim'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" color select
Plug 'morhetz/gruvbox'
  let g:gruvbox_contrast_dark = 'soft'
Plug 'connorholyday/vim-snazzy'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'yuttie/hydrangea-vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'AlessandroYorba/Despacio'
Plug 'cocopon/iceberg.vim'
Plug 'w0ng/vim-hybrid'
Plug 'nightsense/snow'
Plug 'nightsense/stellarized'
Plug 'arcticicestudio/nord-vim'
Plug 'nightsense/cosmic_latte'
Plug 'Iron-E/nvim-highlite'
Plug 'ghifarit53/tokyonight-vim'
Plug 'ayu-theme/ayu-vim'

" debugger
" Plug 'puremourning/vimspector'

" Chinese vim document
Plug 'yianwillis/vimcdoc'
Plug 'nanotee/nvim-lua-guide'

" test nvim
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' } " to test the neovim open time
Plug 'tweekmonster/helpful.vim', { 'on': 'HelpfulVersion' } " to test the neovim open time

call plug#end()
endif
