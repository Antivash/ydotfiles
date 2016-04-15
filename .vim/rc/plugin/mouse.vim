
" ======== Mouse Setting ======== "
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=""
  " For screen.
  if &term =~ "^screen"
    augroup MyAutoCmd
      autocmd!
      autocmd VimLeave * :set mouse=
    augroup END

    " screenでマウスを使用するとフリーズするのでその対策
    set ttymouse=xterm2
  endif

  if has('gui_running')
    " Show popup menu if right click.
    set mousemodel=popup
    " Don't focus the window when the mouse pointer is moved.
    set nomousefocus
    " Hide mouse pointer on insert mode.
    set mousehide
  endif
endif
