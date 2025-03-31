#--------------------------------------------------------------#
##          Start Zellij                                      ##
#--------------------------------------------------------------#
eval "$(zellij setup --generate-auto-start zsh)"

#--------------------------------------------------------------#
##          Powerline 10K                                     ##
#--------------------------------------------------------------#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

#==============================================================#
#               .zshrc                                         #
#==============================================================#

# profile
if [ "$ZSHRC_PROFILE" != "" ]; then
	zmodload zsh/zprof && zprof > /dev/null
fi

#--------------------------------------------------------------#
##          Base Configuration                                ##
#--------------------------------------------------------------#
source-safe() { if [ -f "$1" ]; then source "$1"; fi }
source "$ZRCDIR/base.zsh"


#--------------------------------------------------------------#
##          Options                                           ##
#--------------------------------------------------------------#
source "$ZRCDIR/option.zsh"


#--------------------------------------------------------------#
##          Completion                                        ##
#--------------------------------------------------------------#
source "$ZRCDIR/completion.zsh"


#--------------------------------------------------------------#
##          Prompt Configuration                              ##
#--------------------------------------------------------------#
#source "$ZRCDIR/prompt.zsh"


#--------------------------------------------------------------#
##          Function                                          ##
#--------------------------------------------------------------#
source "$ZRCDIR/function.zsh"


#--------------------------------------------------------------#
##          Aliases                                           ##
#--------------------------------------------------------------#
source "$ZRCDIR/alias.zsh"


#--------------------------------------------------------------#
##          Key Bindings                                      ##
#--------------------------------------------------------------#
source "$ZRCDIR/bindkey.zsh"

source-safe "$ZHOMEDIR/zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}"
source "$ZHOMEDIR/zkbd/bindkey.zsh"


#--------------------------------------------------------------#
##          Plugin                                            ##
#--------------------------------------------------------------#
source "$ZRCDIR/pluginlist.zsh"


#--------------------------------------------------------------#
##          Post Execution                                    ##
#--------------------------------------------------------------#
source "$ZRCDIR/post_load.zsh"


#--------------------------------------------------------------#
##          Execute Script                                    ##
#--------------------------------------------------------------#
source-safe "$ZHOMEDIR/.zshrc.local"


if [ -n "$ZSHRC_CI_TEST" ]; then
	echo "zshrc load complete"
	exit
fi

#--------------------------------------------------------------#
##          Powerline 10K                                     ##
#--------------------------------------------------------------#
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

#--------------------------------------------------------------#
##          Conda question mark?                              ##
#--------------------------------------------------------------#
#source ~/.bashrc

#--------------------------------------------------------------#
##          NVM                                               ##
#--------------------------------------------------------------#
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#--------------------------------------------------------------#
##          DirEnv                                            ##
#--------------------------------------------------------------#
eval "$(direnv hook zsh)"

[[ -r ${TTY:-} && -w ${TTY:-} && $+commands[stty] == 1 ]] && stty -ixon <$TTY >$TTY
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/antivash/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/antivash/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/antivash/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/antivash/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

