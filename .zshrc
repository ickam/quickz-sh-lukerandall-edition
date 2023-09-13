# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lukerandall"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    history-substring-search
    screen
    #systemd
    web-search
    extract
    encode64
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
alias taskman="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head"
alias subs="subliminal --opensubtitles ickam89@gmail.com 'zxNvEZL36VQ#Eq' 
download -l en"
alias napisy="subliminal --opensubtitles ickam89@gmail.com 
'zxNvEZL36VQ#Eq' download -l pl"
alias mdl="megatools dl"
alias xcopy="rsync --bwlimit=15360"
alias bat="pmset -g batt" #macOS only
alias update="softwareupdate --all --install -R" 
# CUSTOM FUNCTIONS
# cheat sheets (github.com/chubin/cheat.sh), find out how to use commands
# example 'cheat tar'
# for language specific question supply 2 args first for language, second 
as the question
# example: cheat python3 execute external program
cheat() {
    if [ "$2" ]; then
        curl "https://cheat.sh/$1/$2+$3+$4+$5+$6+$7+$8+$9+$10"
    else
        curl "https://cheat.sh/$1"
    fi
}
# Matrix screen saver! will run if you have installed "cmatrix"
# TMOUT=900
# TRAPALRM() { if command -v cmatrix &> /dev/null; then cmatrix -sb; fi }
speedtest() {
    curl -s 
https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
}
dadjoke() {
    curl https://icanhazdadjoke.com
}
# Find dictionary definition
dict() {
    if [ "$3" ]; then
        curl "dict://dict.org/d:$1 $2 $3"
    elif [ "$2" ]; then
        curl "dict://dict.org/d:$1 $2"
    else
        curl "dict://dict.org/d:$1"
    fi
}
# Find geo info from IP
ipgeo() {
    # Specify ip or your ip will be used
   curl "http://ipinfo.io/"
}
# Show covid-19 spread stats
corona() {
    # Specify country otherwise shows stats for all
    if [ "$1" ]; then
        curl "https://corona-stats.online/$1"
    else
        curl "https://corona-stats.online"
    fi
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
