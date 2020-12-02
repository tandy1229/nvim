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
"
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> gruvbox
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

" colorscheme gruvbox
" set background=dark    " Setting dark mode


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> colorscheme deus
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

color deus
hi NonText ctermfg=gray guifg=grey10



" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> airline
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

let g:airline_extensions = [ 'branch', 'hunks', 'tabline' ] " make it fast

" beautify
let g:airline_theme="deus" 
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#default#layout = [
    \ ['a', 'error', 'b', 'c'],
    \ ['warning', 'y', 'z', 'x']
    \ ]
let g:airline_section_x = '%{ScrollStatus()}'

function! AirlineInit()
  let g:airline_section_b = airline#section#create(['hunks' ])
  let g:airline_section_warning = airline#section#create(['[', 'filetype',']'])
  let g:airline_section_error= airline#section#create(['branch'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()


" 这个是安装powerline字体后 必须设置此项
let g:airline_powerline_fonts = 1  

" 打开tabline功能,方便查看Buffer和切换，这个功能比较不错
" 我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>




" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> LeaderF
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

nnoremap fff :LeaderfFile<CR>
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0





" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> rainbow
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle






" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> defx(新型异步文件管理器)
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

call defx#custom#option('_', {
      \ 'winwidth': 35,
      \ 'split': 'vertical',
		  \ 'direction': 'botright',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': 'defxplorer',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

" 备用键位
" Toggle Defx using Ctrl + Space
map D :Defx<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> <BS>
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

let g:defx_icons_enable_syntax_highlight = 1








" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> undotree
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

nnoremap L :UndotreeToggle<cr>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> k <plug>UndotreeNextState
	nmap <buffer> j <plug>UndotreePreviousState
	nmap <buffer> K 5<plug>UndotreeNextState
	nmap <buffer> J 5<plug>UndotreePreviousState
endfunc




" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> vista.vim
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" function! NearestMethodOrFunction() abort
" 	return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15















" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> fzf
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

set rtp+=/usr/local/opt/fzf
map ff :FZF<CR>
" noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :History<CR>
"noremap <C-t> :BTags<CR>
noremap <silent> <C-l> :Lines<CR>
noremap <silent> <C-b> :Buffers<CR>
noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'


function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }



" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> far.vim
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

noremap <LEADER>f :F  **/*<left><left><left><left><left>
let g:far#mapping = {
		\ "replace_undo" : ["l"],
		\ }






" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> vim-table-mode
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'







" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> vim-instant-markdown
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1





" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> nvim-treesitter
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
"  ensure_installed = { "all" },     -- one of "all", "language", or a list of languages

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,         -- false will disable the whole extension
    disable = {},          -- list of language that will be disabled
  },
  indent = {
    enable = true
  }
}
EOF

" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> xtabline
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

" let g:xtabline_settings = get(g:, 'xtabline_settings', {})
" let g:xtabline_settings.enable_mappings = 0
" let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
" let g:xtabline_settings.mode_labels = 'secondary'
" let g:xtabline_settings.enable_persistance = 0
" let g:xtabline_settings.last_open_first = 1
" let g:xtabline_settings.tab_icon = ["*", "*"]
" let g:xtabline_settings.icons = {
"         \'pin': '📌',
"         \'star': '★',
"         \'book': '📖',
"         \'lock': '🔒',
"         \'hammer': '🔨',
"         \'tick': '✔',
"         \'cross': '✖',
"         \'warning': '⚠',
"         \'menu': '☰',
"         \'apple': '🍎',
"         \'linux': '🐧',
"         \'windows': '⌘',
"         \'git': '',
"         \'palette': '🎨',
"         \'lens': '🔍',
"         \'flag': '🏁',
"         \}




" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> goyo.vim
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

map <LEADER>gy :Goyo<CR>





" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> AsyncRun
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

noremap gp :AsyncRun git push<CR>


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> AsyncTask
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

let g:asyncrun_open = 6


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> vim-subversive
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)




" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> rnvimr
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]



" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> vim-illuminate
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl



" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> vim-rooter
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> tabular
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

vmap ga :Tabularize /


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> limelight
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

nmap <Leader>; :Limelight<CR> 
nmap <Leader>' :Limelight!<CR> 
let g:limelight_default_coefficient = 0.7



" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> vim-markdown-toc
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> indentline
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

" let g:indentLine_char_list = ['|', '¦', '┆', '┊']



" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> fzf-gitignore
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

noremap <LEADER>gi :FzfGitignore<CR>



" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" >>> vim-git
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>
