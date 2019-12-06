#!/usr/bin/env bash

set -ue

CURRENT_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
source $CURRENT_DIR/lib/dotsinstaller/utilfuncs.sh


#--------------------------------------------------------------#
##          Functions                                         ##
#--------------------------------------------------------------#

function helpmsg() {
  print_default "Usage: "${BASH_SOURCE[0]:-$0}" [install | update | link] [--no-gui] [--emoji] [--extra] [--all] [--help | -h]" 0>&2
  print_default '  install: add require package install and symbolic link to $HOME from dotfiles [default]'
  print_default '  update: add require package install or update.'
  print_default '  link: only symbolic link to $HOME from dotfiles.'
  print_default '  --all: --extra + --emoji'
  print_default ""
}


#--------------------------------------------------------------#
##          main                                              ##
#--------------------------------------------------------------#


function main() {
  local is_install="false"
  local is_link="false"
  local is_update="false"
  local no_gui="false"
  local emoji="false"
  local extra="false"

  while [ $# -gt 0 ];do
    case ${1} in
      --help|-h)
        helpmsg
        exit 1
        ;;
      install)
        is_install="true"
        is_update="true"
        is_link="true"
        ;;
      update)
        is_install="true"
        is_link="false"
        is_update="true"
        ;;
      link)
        is_install="false"
        is_link="true"
        is_update="false"
        ;;
      --no-gui)
        no_gui="true"
        ;;
      --emoji)
        emoji="true"
        ;;
      --extra)
        extra="true"
        ;;
      --all)
        emoji="true"
        extra="true"
        ;;
      --verbose|--debug)
        set -x; shift
        ;;
      *)
        echo "[ERROR] Invalid arguments '${1}'"
        usage
        exit 1
        ;;
    esac
    shift
  done

  # default behaviour
  if [[ "$is_install" == false && "$is_link" == false && "$is_update" == false ]]; then
    is_install="true"
    is_link="true"
    is_update="true"
  fi

  if [[ ! -e "$HOME/.bin/"$(basename "${BASH_SOURCE[0]:-$0}") ]]; then
    is_install=true
  fi


  if [[ "$is_install" = true ]];then
    source $CURRENT_DIR/lib/dotsinstaller/install-required-packages.sh
  fi

  if [[ "$is_link" = true ]];then
    source $CURRENT_DIR/lib/dotsinstaller/link-to-homedir.sh
    source $CURRENT_DIR/lib/dotsinstaller/gitconfig.sh
    print_info ""
    print_info "#####################################################"
    print_info "$(basename "${BASH_SOURCE[0]:-$0}") link success!!!"
    print_info "#####################################################"
    print_info ""
  fi

  if [[ "$is_update" = true ]];then
    source $CURRENT_DIR/lib/dotsinstaller/install-basic-packages.sh
    source $CURRENT_DIR/lib/dotsinstaller/install-neovim.sh
    source $CURRENT_DIR/lib/dotsinstaller/install-fzf.sh

    if [[ "$emoji" = true ]];then
      source $CURRENT_DIR/lib/dotsinstaller/install-emoji-env.sh
    fi

    if [[ "$extra" = true ]];then
      source $CURRENT_DIR/lib/dotsinstaller/install-extra.sh
    fi

    if [[ "$no_gui" = false ]];then
      source $CURRENT_DIR/lib/dotsinstaller/setup-terminal.sh
      source $CURRENT_DIR/lib/dotsinstaller/install-i3.sh
      source $CURRENT_DIR/lib/dotsinstaller/setup-default-app.sh
      source $CURRENT_DIR/lib/dotsinstaller/install-font.sh
    fi

    print_info ""
    print_info "#####################################################"
    print_info "$(basename "${BASH_SOURCE[0]:-$0}") update finish!!!"
    print_info "#####################################################"
    print_info ""
  fi
}


main "$@"

