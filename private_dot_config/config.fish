# config.fish from heidihoe
#   __ _     _                      __ _       
#  / _(_)___| |__   ___ ___  _ __  / _(_) __ _ 
# | |_| / __| '_ \ / __/ _ \| '_ \| |_| |/ _` |
# |  _| \__ \ | | | (_| (_) | | | |  _| | (_| |
# |_| |_|___/_| |_|\___\___/|_| |_|_| |_|\__, |
#                                        |___/ 
#
#


# adding flags
# alias df='df -h'                          # human-readable sizes

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

alias python="python3.12"
# Abbr'sss
abbr dtoday "find . -ctime -1 -type d -not -path '*alte*' | sort"
abbr ftoday "find . -ctime -1 -type f -not -path '*alte*' | sort"
abbr ls "lsd"
abbr ll "lsd -al"
abbr llt "lsd -al -tr"
abbr gs "git status"
abbr gd "git diff"
abbr glg "git log --oneline --decorate --graph --parents --all"
abbr glo "git log --oneline "
abbr nvf 'nvim $(fzf)'
abbr nv "nvim"
abbr py "python3.12"
abbr nvk "NVIM_APPNAME=nvim-kickstart nvim"
abbr nvl "NVIM_APPNAME=nvim-lazy nvim"
abbr nva "nvim"
abbr nvq "NVIM_APPNAME=nvim-quarto nvim"
abbr efc "$EDITOR ~/.config/fish/config.fish"
abbr enc "$EDITOR ~/.config/nvim/"
abbr privO "cd $privobs"
abbr privB "cd $privbew"
abbr workO "cd $workobs"
abbr workN "cd $workdir"
abbr nvwork "cd $workobs && nvim ."
abbr lg "lazygit"
abbr ld "lazydocker"
abbr ssdmount "sudo diskutil mount -mountpoint /Volumes/ext-hub/ /dev/disk5s1"
abbr cdf 'cd (find * -type d | fzf)'
abbr df "df -h"                          # human-readable sizes
abbr ds "du -hs"
abbr sa "du -hd 1"
abbr mv "mv -iv"
abbr cp "cp -iv"
abbr desktop "cd ~/Desktop/"
abbr music "cd ~/Music/"
abbr .. "cd .."
abbr ... "cd ../.."
abbr .... "cd ../../.."
abbr numFiles "ls -1 | wc -l" # numFiles:     Count of non-hidden files in current dir





# function to mkdir if not existing and cd into it
function mkcd; mkdir -p $argv[1]; and cd $argv[1]; end
# function ytll; yt-dlp 
# abbr ytdlp 'yt-dlp "\"(pbpaste)\""'
function ytll; set clipboardlink (pbpaste); echo $clipboardlink; yt-dlp  $clipboardlink; end
function getmd; set clipboardlink (pbpaste); echo $clipboardlink; wget 'https://r.jina.ai/'$clipboardlink; end
function getmd2
    echo "Converting clipboard content to Markdown..."
    echo "pandoc -f html -t markdown -o output.md (pbpaste)"
    pandoc -f html -t markdown -o output.md (pbpaste)
end


function cpecho; read -l -P "Enter filename for transscript: " scriptnamefile; echo $scriptnamefile; end 
function ytsf; 
    read -l -P "Enter filename for transscript: " scriptnamefile
    set clipboardlink (pbpaste)
    echo $scriptnamefile
    echo $clipboardlink
    mash ai youtube-transcribe $clipboardlink | tee $scriptnamefile
end 

