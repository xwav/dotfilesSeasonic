# Setup fzf
# ---------
if [[ ! "$PATH" == */home/xwav/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/xwav/.fzf/bin"
fi

# Auto-completion
# ---------------
# [[ $- == *i* ]] && source "/home/xwav/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/xwav/.fzf/shell/key-bindings.bash"
