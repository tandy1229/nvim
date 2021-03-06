" >>> nvim-treesitter
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
lua require('treesitter')
lua require'colorizer'.setup()

" >>> color
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
color deus
hi NonText ctermfg=gray guifg=grey10

" >>> barbar.nvim
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let bufferline = {}
let bufferline.animation = v:false
let bufferline.maximum_padding = 1
let bufferline.icon_close_tab_modified = ''
nnoremap <silent> <M-c> :BufferClose<CR>

" >>> eleline
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:airline_powerline_fonts = 1                     " use powerline font

" >>> LeaderF
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
nnoremap <leader>lf :LeaderfFile<CR>
nnoremap <LEADER>lh :Leaderf help<CR>
nnoremap <LEADER>lm :Leaderf mru<CR>
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2" }
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

" >>> undotree
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
nnoremap U :UndotreeToggle<cr>
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
noremap <leader>c :silent! Vista finder coc<CR>
noremap ,c :silent! Vista finder ctags<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
let g:scrollstatus_size = 15
autocmd BufRead,BufNewFile *.json let g:vista_default_executive = 'coc'
autocmd BufRead,BufNewFile *.py let g:vista_default_executive = 'coc'

" >>> vim-go
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0

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
nnoremap <silent> <Leader>ft       :Tags<CR>
nnoremap <silent> <Leader>m        :Maps<CR>
nnoremap <silent> <c-h>            :Helptags<CR>

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
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

" >>> rnvimr
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
let g:rnvim_shadow_winblend = 70
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

" >>> nvim-lazygit
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:lazygit_floating_window_winblend = 0                        " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9                " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1                               " for neovim-remote support
nnoremap <silent> <leader>lg :LazyGit<CR>

" >>> vimspecter
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:vimspector_enable_mappings = 'HUMAN'

" >>> calendar
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
noremap <leader>\ :Calendar -view=clock -position=here<CR>

" >>> vim-after-object
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" >>> vim-smoothie
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:smoothie_no_default_mappings = 1
silent! map  J      <Plug>(SmoothieDownwards)
silent! map  K      <Plug>(SmoothieUpwards)

" >>> editorconfig
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" >>> vim-markdown
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:markdown_fenced_languages = [
      \ 'html',
      \ 'c',
      \ 'cpp',
      \ 'python',
      \ 'bash=sh',
      \ 'css',
      \ 'javascript',
      \ 'js=javascript',
      \ 'typescript',
      \ 'awk',
      \ 'lua',
      \ 'vim',
      \ 'help',
      \ 'yaml'
      \]

" >>> rainbow_parentheses
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:rainbow#max_level = 20
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
augroup rainbow_lisp
  autocmd!
  autocmd FileType perl,sh,zsh,vim,python,lisp,clojure,scheme RainbowParentheses
augroup END
let g:rainbow#blacklist = ['#F1FA8C', '#4D4D4D', '#eaeae1' ]

" >>> autosave
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" inspired by https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:autosave(enable)
  augroup autosave
    autocmd!
    if a:enable
      autocmd TextChanged,InsertLeave <buffer>
            \  if empty(&buftype) && !empty(bufname(''))
            \|   silent! update
            \| endif
    endif
  augroup END
endfunction

command! -bang AutoSave call s:autosave(<bang>1)

" >>> markdown clipboard
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

" >>> any-jump
" '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9
