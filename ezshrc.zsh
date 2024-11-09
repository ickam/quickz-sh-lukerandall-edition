export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/ezsh/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes


ZSH_THEME="lukerandall"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    history-substring-search
    screen
    #systemd
    web-search
    extract
    z

)
  
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8



# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias myip="wget -qO- https://wtfismyip.com/text"	# quickly show external ip address
alias l="ls -lah"
alias x="extract"
alias taskman="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head"
alias subs="subliminal --opensubtitles ickam89@gmail.com 'zxNvEZL36VQ#Eq' 
download -l en"
alias napisy="subliminal --opensubtitles ickam89@gmail.com 
'zxNvEZL36VQ#Eq' download -l pl"
alias mdl="megatools dl"
alias xcopy="rsync --bwlimit=15360"
alias batt="pmset -g batt" #macOS only
alias update="softwareupdate --all --install -R" 
alias audiox='yt-dlp -x --audio-format mp3 "$1"'
alias jdhead='java -Djava.awt.headless=true -jar JDownloader.jar'
alias cycles="system_profiler SPPowerDataType | grep "Cycle Count" | awk '{print $3}'"
alias code="open -a VSCodium"
alias watts="system_profiler SPPowerDataType | grep "Wattage" | awk '{print $3}'"
alias battcap="system_profiler SPPowerDataType | grep "Maximum Capacity" | awk '{print $3}'"
alias backup="tmutil startbackup"

# CUSTOM FUNCTIONS
# cheat sheets (github.com/chubin/cheat.sh), find out how to use commands
# example 'cheat tar'
# for language specific question supply 2 args first for language, second as the question
# example: cheat python3 execute external program
cheat() {
    if [ "$2" ]; then
        curl "https://cheat.sh/$1/$2+$3+$4+$5+$6+$7+$8+$9+$10"
    else
        curl "https://cheat.sh/$1"
    fi
}

# Find geo info from IP
ipgeo() {
    # Specify ip or your ip will be used
   curl "http://ipinfo.io/"
}

rand100() {
curl https://www.random.org/integers/\?num\=1\&min\=1\&max\=100\&col\=1\&base\=10\&format\=plain\&rnd\=new &&
}
rand4() {
curl  
https://www.random.org/integers/\?num\=10\&min\=1\&max\=4\&col\=1\&base\=10\&format\=plain\&rnd\=new
}
randp() {
curl https://www.random.org/integers/\?num\=1\&min\=69\&max\=65000\&col\=1\&base\=10\&format\=plain\&rnd\=new &&
}


batchremux() {
for f in *.mp4; do ffmpeg -i "$f" -c copy "${f%.mp4}.mkv"; done
}
sjpg() {
ffmpeg \
-ss 00:11:19 -i "$1" \
-ss 00:21:36 -i "$1" \
-ss 00:33:05 -i "$1" \
-ss 00:45:51 -i "$1" \
-map 0:v -vframes 1 output_01.jpg \
-map 1:v -vframes 1 output_02.jpg \
-map 2:v -vframes 1 output_03.jpg \
-map 3:v -vframes 1 output_04.jpg
}
spng() {
ffmpeg \
-ss 00:11:19 -i "$1" \
-ss 00:21:36 -i "$1" \
-ss 00:33:05 -i "$1" \
-ss 00:45:51 -i "$1" \
-map 0:v -vframes 1 output_01.png \
-map 1:v -vframes 1 output_02.png \
-map 2:v -vframes 1 output_03.png \
-map 3:v -vframes 1 output_04.png
}
convert() {
ebook-convert "$1" "$2" --remove-paragraph-spacing
}

bulkrm() {
find . -name "$1" -type f -delete
}