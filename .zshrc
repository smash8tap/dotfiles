# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# neofetch
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/smash8tap/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# POWERLEVEL9K_MODE="nerdfont-complete"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
plugins=(themes vi-mode git zsh-autosuggestions zsh-syntax-highlighting archlinux sudo tmux docker colored-man-pages fzf nmap systemd autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# General Aliases 
alias ls='lsd'
alias ip='ip -c=always'
alias vim='nvim'
alias cat='bat'
alias tmp='cd $(mktemp -d)'
weather() { curl wttr.in/"$1" }
# alias scan='if ! [ -d ./nmap ]; then mkdir nmap; echo "**** Directory to save nmap scan created (nmap)****";echo "Starting scan with sudo nmap -sC -sS -sV -oA nmap/inital -vv"; fi;sudo nmap -sC -sS -sV -oA nmap/inital -v
scan() { if ! [ -d ./nmap ]; then mkdir nmap; echo "[+]**** Directory to save nmap-scan created (nmap)****";echo "[+]Starting scan with sudo rustscan --ulimit 65000 -b 65535 -a $1 -- -sC -sS -sV -oA nmap/inital -vv"; fi;sudo rustscan --ulimit 65000 -b 65535 -a "$1" -- -sC -sS -sV -Pn -oA  nmap/inital; }
alias xclip='xclip -sel clip'
alias p_theme='~/.config/polybar/launch.sh'
alias enum4linux='enum4linux-ng'

# Aliases for CTFs
shellup() { echo "python3 -c \"import pty;pty.spawn('/bin/bash')\" " | xclip }
# alias nc='rlwrap nc'
alias srv='python3 -m http.server'
alias getip='ip a | grep tun0 | grep -oP "inet .*/" | grep -oP "(\d+\.){3}\d+" | tr -d "\n"| xclip'
alias getrevp='cp /usr/share/webshells/php/php-reverse-shell.php ./rev.php'
alias getle='cp /usr/share/linenum/LinEnum.sh .'
alias getlp='cp /usr/share/peass/linPEAS/linpeas.sh .'
alias getwp='cp  /usr/share/privilege-escalation-awesome-scripts-suite/winPEAS/winPEASexe/binaries/x86/Release/winPEASx86.exe .'

IP() { echo "$1" > /tmp/ip; export IP=$(cat /tmp/ip);}
if [ -f /tmp/ip ]; then
  export IP=$(cat /tmp/ip);
fi 

# Random Aliases
alias disp='xrandr --output "DP-0" --auto --output "HDMI-0" --mode 1920x1080 --right-of "DP-0"'
trans() { sed -i "s/rgba(40, 42, 54, .*)/rgba(40, 42, 54, $1)/g" /home/smash8tap/.config/termite/config; killall -USR1 termite }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# autojump
[[ -s /home/smash8tap/.autojump/etc/profile.d/autojump.sh ]] && source /home/smash8tap/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
# Path variable
export PATH=$PATH:/home/smash8tap/.local/bin:/home/smash8tap/go/bin:/home/smash8tap/.gem/ruby/2.7.0/bin
export ru="/usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt"


# Cursor autochange


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
       echo -ne '\e[1 q'
     elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
            echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
  echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Binding for vi-mode

bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

export PATH=/home/$USER/.config/nvcode/utils/bin:$PATH
export PATH=/home/$USER/.config/nvcode/utils/bin:$PATH
