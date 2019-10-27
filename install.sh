#!/usr/bin/env bash

# For each rc/config file, move the current file (if exists) to backup and 
# symlink the file with the one present in git repo

resource_files=(zshrc zshenv vimrc gitconfig tmux.conf dircolors)

home=$HOME

declare -A apps

apps[zsh]=zsh
apps[tmu]=tmux
apps[vim]=vim
apps[git]=git
apps[dir]=dircolors

BOLD='\033[1m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

dir=$(dirname "$0")

read -p "Directory is ${dir}, continue ? (y/n) " yn
case $yn in
	[Yy]* ) ;;
	[Nn]* ) exit;;
	* ) echo "Please answer yes or no.";;
esac

# Setup rcfiles
for file in ${resource_files[@]}; do
    echo -e "Processing ${BOLD}${RED}$file ${NC}"
    rcfile=${home}/.${file}

    app=${apps[${file:0:3}]}
    echo "$file - ${file:0:3} - $app - ${apps[${file:0:3}]}"
    read -p "Continue ? (y/n) " yn
    if [[ $yn == "n" ]]; then
        exit;
    fi
    lnk=${dir}/${app}/${file}

    if [[ -f ${rcfile}  ]]; then
        echo "${rcfile} exists, checking if its already symlinked"
        if [[ ${lnk} == $(readlink -f ${rcfile}) ]]; then
            echo -e "${GREEN}${file} is already linked${NC}"
        else
            echo "Moving ${rcfile} to ${rcfile}.bck"
            mv ${rcfile} ${rcfile}.bck
            echo -e "${BLUE}Symlinking ${lnk} to ${rcfile}${NC}"
            ln -s ${lnk} ${rcfile}
        fi
    else 
        echo "Symlinking ${lnk} to ${rcfile}"
        ln -s ${lnk} ${rcfile}
        echo -e "${GREEN} ${rcfile} symlinked"
    fi
    echo
done

# Setup vim
if [[ ! -d ${home}/.vim/backup ]]; then
    mkdir -p ${home}/.vim/backup
fi
if [[ ! -d ${home}/.vim/swap ]]; then
    mkdir -p ${home}/.vim/swap
fi
