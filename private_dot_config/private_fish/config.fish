# config.fish from Andreas
#   __ _     _                      __ _       
#  / _(_)___| |__   ___ ___  _ __  / _(_) __ _ 
# | |_| / __| '_ \ / __/ _ \| '_ \| |_| |/ _` |
# |  _| \__ \ | | | (_| (_) | | | |  _| | (_| |
# |_| |_|___/_| |_|\___\___/|_| |_|_| |_|\__, |
#                                        |___/ 
#
#

set PATH $PATH /Users/andreas/Nextcloud/Files/terminal 

### EXPORT
export EDITOR='vim'
export VISUAL='nano'

# adding flags
# alias df='df -h'                          # human-readable sizes

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Aliases
# alias mv="mv -iv"
# alias cp="cp -iv"
# alias desktop='cd ~/Desktop/'
# alias music='cd ~/Music/'
# alias ..='cd ..'
# alias ...='cd ../..'
# alias ....='cd ../../..'
# alias ="$EDITOR ~/.config/fish/config.fish"
# # alias ll="ls -al -T"
# alias numFiles='ls -1 | wc -l' # numFiles:     Count of non-hidden files in current dir
# alias tt="taskwarrior-tui"
# alias ts="task sync"

# Abbr'sss
abbr df 'df -h'                          # human-readable sizes
abbr ll "ls -al -T"
abbr mv "mv -iv"
abbr cp "cp -iv"
abbr desktop 'cd ~/Desktop/'
abbr music 'cd ~/Music/'
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'
abbr efc "$EDITOR ~/.config/fish/config.fish"
abbr numFiles 'ls -1 | wc -l' # numFiles:     Count of non-hidden files in current dir
abbr tt "taskwarrior-tui"
abbr ts "task sync"
abbr nv "nvim"
abbr hacker 'docker run --rm -it bcbcarl/hollywood'
abbr cmm 'chezmoi'

# neofetch

fish_add_path /opt/homebrew/opt/bison/bin
