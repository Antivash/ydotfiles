" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.

"if s:plug.is_installed('lexima.vim')
"  " do not imap <CR> ! because endwise do not work.
"else
"  if exists('*complete_info')
"    inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"  else
"    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"  endif
"endif

" <C-w>p switch floating window

" Use K to show documentation in preview window
nnoremap ? <Cmd>call <SID>show_documentation()<CR>

function! s:show_documentation() abort
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" sync coc_global_extensions with enable/disable
function! s:sync_coc_global_extensions() abort
  let coc_extensions = CocAction('extensionStats')
  for e in coc_extensions
    if index(g:coc_global_extensions, e['id']) >= 0
      if e['state'] ==? 'disabled'
        call CocActionAsync('toggleExtension', e['id'])
      endif
    else
      if e['state'] !=? 'disabled'
        call CocActionAsync('toggleExtension', e['id'])
      endif
    endif
  endfor
endfunction

function! s:set_tag_func() abort
  " create too heavy tags file
  set tagfunc=CocTagFunc
  for tags_file in tagfiles()
    echom tags_file
    if filereadable(tags_file)
      set tagfunc=
      break
    endif
  endfor
endfunction

function! s:set_init_config() abort
  " Use `:Format` to format current buffer
  command! -nargs=0 Format call CocAction('format')
  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold call     CocAction('fold', <f-args>)
  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  command! CocInstallAll CocInstall -sync
  command! CocUninstallAll call s:coc_uninstall_all()
  command! CocDiagnosticToggle call CocAction('diagnosticToggle')
  command! CocCompletionToggle let b:coc_suggest_disable = !get(b:, 'coc_suggest_disable', '0')
endfunction

augroup vimrc_coc
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,jsonc setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " auto hover
  " autocmd CursorHold * if ! coc#util#has_float() | call CocAction('doHover') | endif
  " https://github.com/neoclide/coc.nvim/issues/1013
  " autocmd FileType vim if bufname('%') == '[Command Line]' | let b:coc_suggest_disable = 1 | endif
  autocmd User CocNvimInit call s:sync_coc_global_extensions()
  autocmd User CocNvimInit call s:set_tag_func()
  autocmd User CocNvimInit call s:set_init_config()
augroup END

nnoremap <coc>   <Nop>
nmap    ; <coc>
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> <coc>d <Plug>(coc-definition)
nmap <silent> <coc>y <Plug>(coc-type-definition)
nmap <silent> <coc>i <Plug>(coc-implementation)
nmap <silent> <coc>r <Plug>(coc-references)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <coc>R <Plug>(coc-rename)
" Remap for format selected region
xmap <coc>f  <Plug>(coc-format-selected)
nmap <coc>f  <Plug>(coc-format-selected)
" Remap for do codeAction of selected region, ex: `<Leader>aap` for current paragraph
xmap <coc>as  <Plug>(coc-codeaction-selected)
nmap <coc>as  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <coc>ac <Plug>(coc-codeaction)
nma M <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <coc>q <Plug>(coc-fix-current)
nmap <coc>l <Plug>(coc-codelens-action)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap <coc>if <Plug>(coc-funcobj-i)
xmap <coc>af <Plug>(coc-funcobj-a)
omap <coc>if <Plug>(coc-funcobj-i)
omap <coc>af <Plug>(coc-funcobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Using CocList
nnoremap <coc>m  <Cmd>CocList<cr>
" Show all diagnostics
nnoremap <coc>d  <Cmd>CocDiagnostics<cr>
nnoremap <coc>D  <Cmd>CocList diagnostics<cr>
" Manage extensions
nnoremap <coc>e  <Cmd>CocList extensions<cr>
" Show commands
nnoremap <coc>c  <Cmd>CocList commands<cr>
" Find symbol of current document
nnoremap <coc>o  <Cmd>CocList outline<cr>
" Search workLeader symbols
nnoremap <coc>s  <Cmd>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <coc>j  <Cmd>CocNext<CR>
" Do default action for previous item.
nnoremap <coc>k  <Cmd>CocPrev<CR>
" Resume latest coc list
nnoremap <coc>p  <Cmd>CocListResume<CR>

function! s:coc_plugin_is_installed(name) abort
  let extensions = get(g:, 'coc_global_extensions', {})
  return (count(extensions, a:name) != 0)
endfunction

function! s:coc_uninstall_all() abort
  for e in g:coc_global_extensions
    execute 'CocUninstall ' . e
  endfor
endfunction


"----------------
" Config
call coc#config('diagnostic', {
      \ 'errorSign': ' ',
      \ 'warningSign': ' ',
      \ 'infoSign': ' ',
      \ 'hintSign': ' '
      \ })
" ❌ 💡  ⓘ   ⚑ ✗
call coc#config('suggest.triggerCompletionWait', '100')
call coc#config('suggest.triggerSignatureWait', '100')
call coc#config('suggest.asciiCharactersOnly', 'true')
call coc#config('coc.preferences.currentFunctionSymbolAutoUpdate', 'true')
call coc#config('coc.preferences.formatOnType', 'true')
call coc#config("coc.preferences", {
      \ "formatOnSaveFiletypes": [
      \ "css",
      \ "js",
      \ "javascriptreact",
      \ "ts",
      \ "typescriptreact",
      \ "typescript",
      \ "html",
      \ "scss",
      \ "sass",
      \ "json",
      \ "c",
      \ "cpp",
      \ "go",
      \ "rust",
      \ "python"
      \]})
" Plugins
call coc#config('yank.enableCompletion', 'false')
call coc#config('snippets', {
      \ 'userSnippetsDirectory': '~/.config/nvim/snippets/',
      \ 'snipmate.enable': 'false',
      \ 'convertToSnippetsAction': 'false'
      \ })
call coc#config('explorer.icon.enableNerdfont', 'true')
call coc#config('explorer.previewAction.onHover', 'content')
call coc#config('session.directory', '~/.local/share/nvim/sessions')
call coc#config('codeLens.enable', 'true')
call coc#config('tabnine.priority', 50)
call coc#config('cSpell.showStatus', 'false')
call coc#config('cSpell.enabledLanguageIds', ["markdown","plaintext"])
call coc#config('project.dbpath', '~/.local/share/nvim/coc-project')
call coc#config('translator', {
      \ 'toLang': 'ja',
      \ 'engines': [
      \   'google',
      \   'bing'
      \ ]})
" coc-diagnostic
"if executable('efm-langserver')
"  call coc#config('languageserver.efm', {
"        \ 'command': 'efm-langserver',
"        \ 'args': [],
"        \ 'filetypes': ['vim', 'eruby', 'markdown', 'yaml', 'sh']
"        \})
"  "   // custom config path
"  "   // 'args': ['-c', '/path/to/your/config.yaml'],
"endif

" Languages
call coc#config('diagnostic-languageserver.filetypes', {
      \ 'vim': 'vint',
      \ 'markdown': [ 'write-good', 'markdownlint' ],
      \ 'sh': 'shellcheck',
      \ })
call coc#config('list.insertMappings', {
      \ '<C-v>': 'action:vsplit',
      \ '<C-s>': 'action:split',
      \ '<C-w>': 'command:wincmd k'
      \ })
call coc#config('rust-analyzer', {
      \ 'cargo-watch.enable': 'true',
      \ 'cargo-watch.command': 'clippy',
      \ 'cargo-watch.allTargets': 'true',
      \ 'lens.methodReferences': 'true',
      \ 'hoverActions.linksInHover': 'true',
      \ 'procMacro.enable': 'true'
      \ })
" uncaughtException Error: write EPIPE
"call coc#config('git.addGBlameToBufferVar', 'true')
call coc#config('python.jediEnabled', 'false')
call coc#config('Lua', {
      \ 'completion.displayContext': 3,
      \ 'completion.workspaceWord': 'false',
      \ 'window.progressBar': 'false'
      \ })
call coc#config('emmet.includeLanguages', {
      \ 'vue-html': 'html',
      \ 'javascript': 'javascriptreact'
      \ })
call coc#config('tsserver.enable', 'false')


"----------------
" Plugins
if s:coc_plugin_is_installed('coc-snippets')
  imap <C-l> <Plug>(coc-snippets-expand)
  " vmap <C-k> <Plug>(coc-snippets-select)
  let g:coc_snippet_next = '<c-s>'
  let g:coc_snippet_prev = '<c-t>'
  imap <C-s> <Plug>(coc-snippets-expand-jump)
  " inoremap <silent><expr> <TAB>
  "       \ pumvisible() ? coc#_select_confirm() :
  "       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  "       \ <SID>check_back_space() ? "\<TAB>" :
  "       \ coc#refresh()
endif

if s:coc_plugin_is_installed('coc-yank')
  highlight HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A
  nnoremap <Leader>y  <Cmd>CocList -A --normal yank<cr>
endif

if s:coc_plugin_is_installed('coc-git')
  " navigate chunks of current buffer
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)
  " navigate conflicts of current buffer
  nmap [c <Plug>(coc-git-prevconflict)
  nmap ]c <Plug>(coc-git-nextconflict)
  " show chunk diff at current position
  nmap <coc>gs <Plug>(coc-git-chunkinfo)
  " show commit contains current position
  nmap <coc>gc <Plug>(coc-git-commit)
  " create text object for git chunks
  omap ig <Plug>(coc-git-chunk-inner)
  xmap ig <Plug>(coc-git-chunk-inner)
  omap ag <Plug>(coc-git-chunk-outer)
  xmap ag <Plug>(coc-git-chunk-outer)
endif

if s:coc_plugin_is_installed('coc-pairs')
  augroup vimrc_coc_pairs
    autocmd!
    autocmd FileType vim let b:coc_pairs_disabled = ['"']
  augroup END
endif

if s:coc_plugin_is_installed('coc-highlight')
  augroup vimrc_coc_highlight
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
  augroup END
endif

if s:coc_plugin_is_installed('coc-explorer')
  nmap gx <Cmd>CocCommand explorer --width 30<CR>
  nmap gX <Cmd>CocCommand explorer --width 30 --reveal<CR>

  augroup vimrc_coc_explorer
    autocmd!
    autocmd VimEnter * sil! au! FileExplorer *
    autocmd BufEnter * let s:d = expand('%:p') | if vimrc#is_dir(s:d) | silent! bd | exe 'CocCommand explorer ' . s:d | endif
  augroup END
endif

if s:coc_plugin_is_installed('coc-spell-checker')
  command! CSpellAddWordToWorkspaceDictionary CocCommand cSpell.addWordToDictionary
  command! CSpellToggle call CocAction('toggleExtension', 'coc-spell-checker')
  "augroup vimrc_coc_spell_checker
  "  autocmd!
  "  autocmd User CocNvimInit sil! call CocAction('toggleExtension', 'coc-spell-checker')
  "augroup END
endif

if s:coc_plugin_is_installed('coc-actions')
  function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
  endfunction
  xmap <coc>a <Cmd>execute 'CocCommand actions.open ' . visualmode()<CR>
  nmap <coc>a <Cmd>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
  xmap M <Cmd>execute 'CocCommand actions.open ' . visualmode()<CR>
  nmap M   <Cmd>execute 'CocCommand actions.open'<CR>
endif

if s:coc_plugin_is_installed('coc-translator')
  nmap <coc>t <Plug>(coc-translator-p)
  vmap <coc>t <Plug>(coc-translator-pv)
endif

if s:coc_plugin_is_installed('coc-floatinput')
  nmap <silent> <coc>: <Plug>(coc-floatinput-command)
  nmap <silent> <coc>:c <Plug>(coc-floatinput-coc-command)
  nmap <silent> <coc>:r <Plug>(coc-floatinput-rename)
endif

if s:coc_plugin_is_installed('coc-rust-analyzer')
  nnoremap <buffer><silent> Q :<C-u>CocCommand rust-analyzer.openDocs<CR>
  nnoremap <buffer><silent> <coc>Q :<C-u>CocCommand rust-analyzer.openDocs<CR>
  nnoremap <buffer><silent> <coc>J :<C-u>CocCommand rust-analyzer.joinLines<CR>
  nnoremap <buffer><silent> <coc>T :<C-u>CocCommand rust-analyzer.peekTests<CR>
  nnoremap <buffer><silent> <coc>R :<C-u>CocCommand rust-analyzer.run<CR>
endif

if s:coc_plugin_is_installed('coc-deno')
  command! DenoInitializeWorkspace CocCommand deno.initializeWorkspace
endif

if s:coc_plugin_is_installed('coc-denoland')
  " https://scrapbox.io/yyano/coc.nvim%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%9FDeno%E3%81%AE%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83
  function! s:switch_coc_ts() abort
    let l:path = empty(expand('%')) ? '.' : '%:p:h'
    if empty(finddir('node_modules', l:path . ';'))
      call coc#config('deno.enable', v:true)
      call coc#config('tsserver.enable', v:false)
    else
      call coc#config('deno.enable', v:false)
      call coc#config('tsserver.enable', v:true)
    endif
  endfunction

  autocmd FileType typescript,typescript.tsx ++once call s:switch_coc_ts()
endif
