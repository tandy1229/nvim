" >>> colorscheme deus
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
set rtp+=/Users/yitaimin/.vim/plugged/nvim-deus
color deus
hi NonText ctermfg=gray guifg=grey10

" >>> airline
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" beautify
let g:airline_theme="deus"
let g:airline#extensions#wordcount#enabled=0
let g:airline#extensions#whitespace#enabled=0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep=''
let g:airline_left_alt_sep='|'
let g:airline_right_sep=''
let g:airline_right_alt_sep='|'
let g:airline_symbols.dirty=''
let g:airline_symbols.notexists = ' ﴻ'
let g:airline_symbols.linenr = ''
let g:airline#extensions#default#layout = [
    \ ['a', 'b', 'error',  'c'],
    \ ['warning', 'y', 'z', 'x']
    \ ]
let g:airline#extensions#hunks#coc_git = 1            " enable coc-git
function! AirlineInit()
  let g:airline_section_x = '%{ScrollStatus()}'
  let g:airline_section_error = airline#section#create([ 'hunks' ])
  let g:airline_section_warning = airline#section#create(['[', 'filetype', ']'])
  let g:airline_section_b= airline#section#create(['branch'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
let g:airline_powerline_fonts = 1                     " use powerline font
" let g:airline#extensions#tabline#enabled = 1          " 打开tabline功能,方便查看Buffer和切换，这个功能比较不错
" let g:airline#extensions#tabline#buffer_nr_show = 1   " 我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer
"设置切换Buffer快捷键"

" >>> LeaderF
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
nnoremap <leader>lf :LeaderfFile<CR>
nnoremap <LEADER>lh :Leaderf help<CR>
nnoremap ; :Leaderf command<CR>
nnoremap <LEADER>lm :Leaderf mru<CR>
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2" }
" let g:Lf_StlSeparator = { 'left': "", 'right': "" }
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

" >>> rainbow
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


" >>> defx(新型异步文件管理器)
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

" >>> undotree
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

" >>> vista.vim
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
let g:scrollstatus_size = 15

" >>> fzf
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
set rtp+=/usr/local/opt/fzf

let $FZF_DEFAULT_OPTS .= ' --inline-info'

" All files
command! -nargs=? -complete=dir AF
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
  \ })))

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

function! s:plug_help_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
  \ 'source': sort(keys(g:plugs)),
  \ 'sink':   function('s:plug_help_sink')}))

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let options = fzf#vim#with_preview(options, 'right', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

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
nnoremap <silent> <c-f>            :Files<CR>
nnoremap <silent> <Leader>fc       :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>fl       :Lines<CR>
nnoremap <silent> <Leader>fh       :History:<CR>
nnoremap <silent> <Leader>fH       :History/<CR>
nnoremap <silent> <Leader>H        :PlugHelp<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
nnoremap <silent> <Leader>rg       :RG<CR>
nnoremap <silent> <Leader>RG       :Rg<CR>
nnoremap <silent> <Leader>fm       :Marks<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)


" >>> far.vim
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
noremap <LEADER>ff :F  **/*<left><left><left><left><left>
let g:far#mapping = {
		\ "replace_undo" : ["l"],
		\ }

" >>> nvim-treesitter
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" lua config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,         -- false will disable the whole extension
    disable = {},          -- list of language that will be disabled
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" >>> goyo.vim
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  Limelight
  let &l:statusline = '%M'
  hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>gy :Goyo<CR>

" >>> AsyncRun
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
noremap gp :AsyncRun git push<CR>

" >>> AsyncTask
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:asyncrun_open = 6

" >>> vim-subversive
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)

" >>> rnvimr
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
let g:rnvim_shadow_winblend = 70
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
" nnoremap <silent> R :RnvimrToggle<CR>
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

" >>> vim-illuminate
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl

" >>> vim-rooter
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

" >>> tabular
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
vmap ga :Tabularize /

" >>> limelight
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
nmap <Leader>; :Limelight<CR>
nmap <Leader>' :Limelight!<CR>
let g:limelight_default_coefficient = 0.7

" >>> vim-markdown-toc
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" >>> fzf-gitignore
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
noremap <LEADER>gi :FzfGitignore<CR>

" >>> nvim-lazygit
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support

nnoremap <silent> <leader>lg :LazyGit<CR>


" >>> vimspecter
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:vimspector_enable_mappings = 'HUMAN'
