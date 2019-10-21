#--------------------------------------------------------------#
##          Plugins                                           ##
#--------------------------------------------------------------#

set-option -g @plugin "tmux-plugins/tpm"
set-option -g @plugin "tmux-plugins/tmux-resurrect"
set-option -g @plugin "tmux-plugins/tmux-continuum"
set-option -g @plugin "tmux-plugins/tmux-copycat"
set-option -g @plugin "tmux-plugins/tmux-yank"
set-option -g @plugin "tmux-plugins/vim-tmux-focus-events"
set-option -g @plugin "tmux-plugins/tmux-open"
set-option -g @plugin "jschaf/tmux-newline-detector"
set-option -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set-option -g @plugin 'tmux-plugins/tmux-online-status'
if 'builtin command -v urlview > /dev/null 2>&1 ' \
  'set-option -g @plugin "tmux-plugins/tmux-urlview"'
set -g @plugin 'Morantron/tmux-fingers'
set -g @plugin 'jbnicolai/tmux-fpp'


#--------------------------------------------------------------#
##          Disable Plugins                                   ##
#--------------------------------------------------------------#

## Disabled for customize coloring
#set-option -g @plugin "jooize/tmux-powerline-theme"
## Disabled for include my tmux.conf
#set-option -g @plugin "#tmux-plugins/tmux-sensible"


#--------------------------------------------------------------#
##          Install/Execute tpm                               ##
#--------------------------------------------------------------#

if '[ ! -d ~/.tmux/plugins/tpm ]' \
  'run-shell "git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"'


if '[ $(echo "`tmux -V | cut -d" " -f2` >= "1.9"" | tr -d "[:alpha:]" | bc) -eq 1 ]' \
  'run-shell "~/.tmux/plugins/tpm/tpm"'


#--------------------------------------------------------------#
##          Non tpm plugins                                   ##
#--------------------------------------------------------------#


#--------------------------------------------------------------#
##          Disable Non tpm Plugins                           ##
#--------------------------------------------------------------#

# Management is awkward. Also finger is not so slow
# if '[ -f ~/.tmux/conf/scripts/install-tmux-thumbs.sh ]' \
#   'run-shell "~/.tmux/conf/scripts/install-tmux-thumbs.sh"'
# if '[ -r ~/.tmux/plugins/tmux-thumbs/tmux-thumbs.tmux ]' \
#   'run-shell "~/.tmux/plugins/tmux-thumbs/tmux-thumbs.tmux"'


#--------------------------------------------------------------#
##          Plugins Config                                    ##
#--------------------------------------------------------------#

set -g @continuum-restore 'on'

if '[ -f ~/.tmux/plugins/tmux-newline-detector/scripts/paste.sh ]' \
  'bind -n C-down run-shell "~/.tmux/plugins/tmux-newline-detector/scripts/paste.sh"'

set -g @fingers-key S
set -g @fingers-highlight-format '#[fg=green,bold,dim]%s'
set -g @fingers-hint-format '#[fg=yellow,bold,dim]%s'
bind-key -n M-s  run-shell "~/.tmux/plugins/tmux-fingers/scripts/tmux-fingers.sh"
bind-key -n M-f  run-shell "~/.tmux/plugins/tmux-fingers/scripts/tmux-fingers.sh"
bind-key -n M-Space  run-shell "~/.tmux/plugins/tmux-fingers/scripts/tmux-fingers.sh"

set -g @fpp-key 'v'

