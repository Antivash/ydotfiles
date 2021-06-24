let g:asyncrun_open = float2nr(&lines * 0.25)
" https://github.com/skywind3000/asyncrun.vim/blob/58d23e70569994b36208ed2a653f0a2d75c24fbc/doc/asyncrun.txt#L181
augroup vimrc_asyncrun
  autocmd!
  " autocmd User AsyncRunStop copen | $ | execute ("AnsiEsc") | wincmd p
  " autocmd User AsyncRunStop copen | $ | wincmd p
augroup END

function s:re_async_run()
  if empty(g:asyncrun_info)
    echom "Please start AsyncRun with arguments"
    return
  endif
  execute 'AsyncRun ' . g:asyncrun_info
endfunction

command! AsyncRunLast call s:re_async_run()

nmap <make>r <Cmd>AsyncRunLast<CR>
cabbrev <expr> A (getcmdtype() ==# ":" && getcmdline() ==# "w]") ? "A" : "AsyncRun"
let g:asyncrun_mode = 'term'
" command! -bang -nargs=+ -range=0 -complete=file AsyncRun
"       \ call asyncrun#run('<bang>', {"mode": "term", "reuse": "1", "name": "asyncrun", "focus": "0",
"       \ "pos": "bottom", "rows": g:asyncrun_open,
"       \ "post": 'echo eval("g:asyncrun_code ? \"Failure\":\"Success\"")'},
"       \ <q-args>, <count>, <line1>, <line2>)
command! -bang -nargs=+ -range=0 -complete=file AsyncRun
      \ call asyncrun#run('<bang>', {"mode": "term", "pos": "toggleterm",
      \ "post": 'echo eval("g:asyncrun_code ? \"Failure\":\"Success\"")'},
      \ <q-args>, <count>, <line1>, <line2>)

function! s:floaterm_run(opts)
  if exists(':FloatermNew') != 2
    return s:errmsg('require voldikss/vim-floaterm')
  endif
  let cmd = 'FloatermNew '
  let cmd .= ' --name=quickterm'
  let cmd .= ' --wintype=split'
  if has_key(a:opts, 'position')
    let cmd .= ' --position=' . fnameescape(a:opts.position)
  endif
  if has_key(a:opts, 'width')
    let cmd .= ' --width=' . fnameescape(a:opts.width)
  endif
  let cmd .= ' --height=0.25'
  if has_key(a:opts, 'title')
    let cmd .= ' --title=' . fnameescape(a:opts.title)
  endif
  let cmd .= ' --autoclose=0'
  let cmd .= ' --silent=' . get(a:opts, 'silent', 0)

  let cwd = (a:opts.cwd == '')? getcwd() : (a:opts.cwd)
  let cmd .= ' --cwd=' . fnameescape(cwd)
  let cmd .= ' ' . fnameescape(asyncrun#script_write(a:opts.cmd, 0))
  exec cmd

  let s:win_num = winnr()
  augroup async_floaterm
    autocmd!
    " autocmd TermEnter term://*/asyncrun.sh stopinsert
    autocmd TermClose term://*/asyncrun.sh execute s:win_num . "wincmd w" | $ | wincmd p
  augroup END

  if get(a:opts, 'focus', 0) == 0
    stopinsert | noa wincmd p
  endif
endfunction
let g:asyncrun_runner.floaterm = function('s:floaterm_run')

function! s:toggleterm_run(opts)
  if exists(':TaskRunnerTerminal') != 2
    return s:errmsg('require akinsho/nvim-toggleterm.lua')
  endif
  let cmd = 'TaskRunnerTerminal '
  let cmd .= ' ' . fnameescape(asyncrun#script_write(a:opts.cmd, 0))
  exec cmd

  let s:win_num = winnr()
  augroup async_toggleterm
    autocmd!
    " autocmd TermEnter term://*/asyncrun.sh stopinsert
    autocmd TermClose term://*#toggleterm#9* if winbufnr(s:win_num) != -1 | execute s:win_num . "wincmd w" | $ | wincmd p | endif
  augroup END
  if get(a:opts, 'focus', 0) == 0
    stopinsert | noa wincmd p
  endif
endfunction
let g:asyncrun_runner.toggleterm = function('s:toggleterm_run')
