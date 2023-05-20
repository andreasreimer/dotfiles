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
export EDITOR='nvim'
export VISUAL='nvim'
export witz='ohhhh geht gerade nicht ...'

# Check if the ignored configuration file exists
if test -f ~/.config/fish/config.fish.ignored
    # Load the ignored configuration file
    source ~/.config/fish/config.fish.ignored
end


# adding flags
# alias df='df -h'                          # human-readable sizes

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Abbr'sss
abbr efc "$EDITOR ~/.config/fish/config.fish"
abbr nvwork 'cd /Volumes/ext-hub/SE-Nextcloud/WorkVaultObsidian/ && nvim .'
abbr df 'df -h'                          # human-readable sizes
abbr ll "ls -al -T"
abbr mv "mv -iv"
abbr cp "cp -iv"
abbr desktop 'cd ~/Desktop/'
abbr music 'cd ~/Music/'
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'
abbr numFiles 'ls -1 | wc -l' # numFiles:     Count of non-hidden files in current dir
abbr tt "taskwarrior-tui"
abbr ts "task sync"
abbr nv "nvim"
abbr lv "lvim"
abbr hacker 'docker run --rm -it bcbcarl/hollywood'
abbr cmm 'chezmoi'
abbr nvf 'nvim $(fzf)'
abbr cdf 'cd $(find * -type d | fzf)'
# neofetch

fish_add_path /opt/homebrew/opt/bison/bin
