#!/usr/bin/env bash

if [[ -x ~/.zsh/zfunc/delta ]]; then
  ~/.zsh/zfunc/delta "$@"
elif builtin command -v "delta" > /dev/null 2>&1; then
  delta "$@"
elif [[ -x /usr/share/git/diff-highlight/diff-highlight ]]; then
  /usr/share/git/diff-highlight/diff-highlight "$@"
else
  diff "$@"
fi
