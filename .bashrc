#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias code=vscodium
alias cava='cava -p ~/.cache/wal/cava-config'

# PS1='[\u@\h \W]\$ '
PS1='[\[\e[0;32m\]\$\[\e[0m\]\u \[\e[0;33m\]\W/\[\e[0m\]]: '

(cat ~/.cache/wal/sequences &)

. "$HOME/.cargo/env"

export PATH=/home/xspt/programs/eww/target/release/:$PATH

neofetch

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
