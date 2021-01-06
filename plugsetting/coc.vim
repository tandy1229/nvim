" coc config
let g:coc_global_extensions = [
	\ 'coc-ci',
	\ 'coc-git',
	\ 'coc-calc',
	\ 'coc-yank',
	\ 'coc-lists',
	\ 'coc-emoji',
	\ 'coc-pairs',
	\ 'coc-tasks',
	\ 'coc-ecdict',
	\ 'coc-syntax',
	\ 'coc-bookmark',
	\ 'coc-snippets',
	\ 'coc-todolist',
	\ 'coc-leetcode',
	\ 'coc-explorer',
	\ 'coc-gitignore',
	\ 'coc-diagnostic',
	\ 'coc-translator',
	\ 'coc-fzf-preview',
	\ 'coc-marketplace',
	\ 'coc-spell-checker',
	\ 'coc-cspell-dicts',
	\ 'coc-go',
	\ 'coc-xml',
	\ 'coc-json',
	\ 'coc-jedi',
	\ 'coc-html',
	\ 'coc-yaml',
	\ 'coc-emmet',
	\ 'coc-vetur',
	\ 'coc-cmake',
	\ 'coc-vimlsp',
	\ 'coc-vimtex',
	\ 'coc-texlab',
	\ 'coc-eslint',
	\ 'coc-python',
	\ 'coc-pyright',
	\ 'coc-tsserver',
	\ 'coc-prettier',
	\ 'coc-sourcekit',
	\ 'coc-solargraph',
	\ 'coc-flutter-tools',
	\ 'coc-rust-analyzer',
	\ 'coc-tslint-plugin']
" complete
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~# '\s'
endfunction

" help document
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>

nmap g= <Plug>(coc-git-nextchunk)
nmap g- <Plug>(coc-git-prevchunk)
nmap H <Plug>(coc-git-chunkinfo) " show the changing info
nmap ,g <Plug>(coc-git-commit)   " show the commit message

" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gm <Plug>(coc-codeaction)
nmap <silent> gn <Plug>(coc-codelens-action)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> gw <Plug>(coc-refactor)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)

xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

nnoremap <C-l> :CocFzfList<CR>
nnoremap <C-c> :CocList commands<CR>
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nnoremap <silent> tw :call CocActionAsync('doHover')<CR>

" open file in coc
nnoremap <silent> <C-p> :<C-u>CocList files<CR>

" coctodolist
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>

" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>

" coc leetcode
noremap <silent> ,r :CocCommand leetcode.run<CR>
noremap <silent> ,s :CocCommand leetcode.submit<CR>
noremap <silent> ,p :CocCommand leetcode.comments<CR>

" ;>>>>>>>
noremap <silent> ; :CocList vimcommands<CR>
noremap <silent> <leader>gi :CocList gitignore<CR>

" commands
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)  " Add `:Fold` command to fold current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')  " Add `:OR` command for organize imports of the current buffer.

" coc-snippets
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:coc_status_warning_sign = '❗'
" let g:coc_status_warning_sign = '⭕'
" let g:coc_status_error_sign = '✖'

let g:coc_disable_uncaught_error=1  " disable coc nodejs error
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ruby_host_prog = exepath('neovim-ruby-host')

" Text Objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <silent> w <Plug>(coc-ci-w)
nmap <silent> b <Plug>(coc-ci-b)

" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
" Apply AutoFix to problem on the current line.
nmap <leader>qf	<Plug>(coc-fix-current)
nmap <M-t> <Plug>(coc-terminal-toggle)
nmap <Leader>bm <Plug>(coc-bookmark-toggle)
nmap <Leader>bj <Plug>(coc-bookmark-next)
nmap <Leader>bk <Plug>(coc-bookmark-prev)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json,html setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	autocmd CursorHold * silent call CocActionAsync('highlight')
	autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
augroup end
