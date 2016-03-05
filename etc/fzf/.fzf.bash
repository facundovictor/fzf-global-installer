# Setup fzf
# ---------
if [[ ! "$PATH" == *<INSTALL_DIR>/bin* ]]; then
  export PATH="$PATH:<INSTALL_DIR>/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *<INSTALL_DIR>/man* && -d "<INSTALL_DIR>/man" ]]; then
  export MANPATH="$MANPATH:<INSTALL_DIR>/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "<INSTALL_DIR>/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "<INSTALL_DIR>/shell/key-bindings.bash"

