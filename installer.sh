#!/bin/bash

# Install directory
INSTALL_DIR=/opt/fzf

# Clones the fzf repo without unnecessary git info.
function git_clone () {
    mkdir -p $INSTALL_DIR
    git clone --depth 1 https://github.com/junegunn/fzf.git $INSTALL_DIR
}

# Execute the fzf official installer, but asking for no rc updates
function install_fzf () {
    $INSTALL_DIR/install --no-update-rc
}

# Update the configuration files to use the install directory
function set_install_dir () {
    sed -i.back "s,<INSTALL_DIR>,${INSTALL_DIR},g" etc/fzf/.fzf.bash 
    sed -i.back "s,<INSTALL_DIR>,${INSTALL_DIR},g" etc/fzf/.fzf.zsh 
}

# Copy all config files to /etc/fzf, and the rc loading into the profile.d
function copy_config_files () {
    mkdir -p /etc/fzf
    cp etc/fzf/.fzf.bash   /etc/fzf/.fzf.bash
    cp etc/fzf/.fzf.zsh    /etc/fzf/.fzf.zsh
    cp etc/fzf/.fzf.config /etc/fzf/.fzf.config
    cp -u etc/profile.d/fzf.sh /etc/profile.d/fzf.sh
}

# Erase all previous fzf installations
function remove_previous_version () {
    rm -rf $INSTALL_DIR
}

# Install pygementize for coloring preview
function install_addons () {
	which pip > /dev/null 2>&1
	if [ $? -eq 0 ] ; then
		pip install Pygments
	fi
}

###############################################################################

# Installation sequence
remove_previous_version
git_clone
install_fzf
set_install_dir
copy_config_files
install_addons

echo "FZF Installed."
