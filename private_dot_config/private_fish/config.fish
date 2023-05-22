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



set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'


function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end
