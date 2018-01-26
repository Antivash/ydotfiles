
"==============================================================
"          Key config                                       {{{
"==============================================================

set <S-F1>=[1;2P
set <S-F2>=[1;2Q
set <S-F3>=[1;2R
set <S-F4>=[1;2S
set <S-F5>=[15;2~
set <S-F6>=[17;2~
set <S-F7>=[18;2~
set <S-F8>=[19;2~
set <S-F9>=[20;2~
set <S-F10>=[21;2~
set <S-F11>=[23;2~
set <S-F12>=[24;2~

" set <C-F1>=<F25>
" set <C-F2>=<F26>
" set <C-F3>=<F27>
" set <C-F4>=<F28>
" set <C-F5>=<F29>
" set <C-F6>=<F30>
" set <C-F7>=<F31>
" set <C-F8>=<F32>
" set <C-F9>=<F33>
" set <C-F10>=<F34>
" set <C-F11>=<F35>
" set <C-F12>=<F36>
" set <C-S-F1>=<F37>

if &term =~ "screen*"
  set <C-Left>=[1;5D
  set <C-Right>=[1;5C
  " noremap <Esc>[1;5D <C-Left>
  " noremap <Esc>[1;5C <C-Right>
  " noremap! <Esc>[1;5D <C-Left>
  " noremap! <Esc>[1;5C <C-Right>
endif

" Enable metakey(But esc key slow when it's enabled)
"execute "set <M-p>=\ep"
"execute "set <M-n>=\en"

