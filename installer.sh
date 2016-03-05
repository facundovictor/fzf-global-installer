#!/bin/bash

# Install directory
INSTALL_DIR=/opt/fzf

function git_clone () {
    mkdir -p $INSTALL_DIR
    git clone --depth 1 https://github.com/junegunn/fzf.git $INSTALL_DIR
}

function install_fzf () {
    $INSTALL_DIR/install --no-update-rc
}

function set_install_dir () {
    sed -i.back "s,<INSTALL_DIR>,${INSTALL_DIR},g" etc/fzf/.fzf.bash 
    sed -i.back "s,<INSTALL_DIR>,${INSTALL_DIR},g" etc/fzf/.fzf.zsh 
}

function copy_config_files () {
    mkdir -p /etc/fzf
    cp etc/fzf/.fzf.bash   /etc/fzf/.fzf.bash
    cp etc/fzf/.fzf.zsh    /etc/fzf/.fzf.zsh
    cp etc/fzf/.fzf.config /etc/fzf/.fzf.config
    cp profile.d/fzf.sh    /etc/profile.d/fzf.sh
}

function remove_previous_version () {
    rm -rf $INSTALL_DIR
}

remove_previous_version
git_clone
install_fzf
set_install_dir
copy_config_files

echo "FZF Installed."
