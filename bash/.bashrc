
# ~/.bashrc
#

### If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '


#-------------------------
# Alias
#-------------------------
### Display more informations about directory content
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'

### Grep color
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

### This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r | less"

### Get rid of command not found ##
alias cd..='cd ..'

### A quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'


### Make mount command output pretty and human readable format
alias mount='mount | column -t'


### Get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='psmem | head -10'

### Get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='pscpu | head -10'

### GPU helpers
# Get current graphic card in use
alias GPUinfo='glxinfo | grep "OpenGL renderer"'
# Needed to be able to use alias with sudo
alias sudo='sudo '
# Force next restart only to use the Nvidia graphic card and also remove sound card blacklist used for PM in intel mode
alias NvidiaProfile='sudo sudo /etc/optimus-manager/nvidia_sound_card.sh on && optimus-manager --temp-config /etc/optimus-manager/optimus-manager_ForceNvidia.conf && sudo shutdown -h now'
# Restore Nvidia sound card blacklisting to be able to completely turn of the nvidia card and get very good battery life
alias IntelProfile='sudo sudo /etc/optimus-manager/nvidia_sound_card.sh off && sudo shutdown -h now'

# Mirrors a site
alias mirrorSite='wget -r -p -U Mozilla -e robots=off --mirror --convert-links --wait=2 --limit-rate=200K'

# Evince default to detached process
alias evince='nohup evince >/dev/null'

# Touchpad switcher
alias togglePad='~/Documents/Logiciels/Utilities/touchpadSwitcher.sh'

# Restart cinnamon
alias restartCinnamon='nohup cinnamon --replace > /dev/null 2>&1 &'
alias restartCinnamonAfterCrash='export DISPLAY=:0; cinnamon --replace &'

# Alias pacman
alias cacheClean='paccache -rk2 && paccache -ruk0'


#-------------------------
# Settings
#-------------------------
### Change umask to make directories sharing easier
umask 0002

### Ignore duplicates in command history
export HISTCONTROL=ignoreboth:erasedups

### Ignore following cmd
export HISTIGNORE='history:history | less:ls:ls -la:cd:cd ..:pwd:NvidiaProfile*:IntelProfile*:GPUinfo*:passc *:subl3:sudo subl3:sudo shutdown*'

### Increase history size (default to 500)
export HISTFILESIZE=20000
export HISTSIZE=10000

## Friendly editor in place of vi
export EDITOR=nvim

#-------------------------
# Personnal Environnement
#-------------------------
### Home
export PATH=$PATH:~/.local/bin:~/bin

### ghcup-hs
export PATH=$PATH:~/.ghcup/bin

### Cabal
export PATH=$PATH:~/.cabal/bin


#-------------------------
# Passc
#-------------------------
alias passc='pass -c'
source /usr/share/bash-completion/completions/pass
complete -F _pass passc

#-------------------------
# Tilix
#-------------------------
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi


#-------------------------
# Oh-my-git
#-------------------------

VIRTUAL_ENV_DISABLE_PROMPT=true
function omg_prompt_callback() {
    if [ -n "${VIRTUAL_ENV}" ]; then
        echo "\e[0;31m(`basename ${VIRTUAL_ENV}`)\e[0m "
    fi
}


source ~/.oh-my-git/prompt.sh



#-------------------------
# Fzf
#-------------------------
# SETUP DEFAULT PARAMETERS
export FZF_DEFAULT_OPTS="--height 80% --no-reverse --tiebreak=length,end,index --header=\"🌵   🦉   🌵\""
export FZF_DEFAULT_COMMAND='fd --hidden --exclude ".git" --exclude ".svn" .'

alias fs='fd --hidden --exclude ".git" --exclude ".svn" .'

# ADD AUTO-COMPLETION
source /usr/share/fzf/completion.bash
# Specific control on how results are shown
# Add support for sublime text, evince, nvim (based on current path)
_fzf_setup_completion path subl3 evince nvim less
_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           fzf "$@" --preview-window right:50%:border --preview 'tree -C {} | head -200' ;;
    subl3)        fzf "$@" --preview-window right:50%:border --preview '(cat {} || tree -C {}) 2> /dev/null | head -200' ;;
    nvim)         fzf "$@" --preview-window right:50%:border --preview '(cat {} || tree -C {}) 2> /dev/null | head -200' ;;
    less)         fzf "$@" --preview-window right:50%:border --preview '(cat {} || tree -C {}) 2> /dev/null | head -200' ;;
    export|unset) fzf "$@" --preview-window right:50%:border --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview-window right:50%:border --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}
# Setup how folders are found
_fzf_compgen_dir() {
  fd --type d --hidden --exclude ".git" --exclude ".svn" . "$1"
}
# Setup how files are found
_fzf_compgen_path() {
  fd --hidden --exclude ".git" --exclude ".svn" . "$1"
}


# ADD KEYBINDINGS SUPPORT
source /usr/share/fzf/key-bindings.bash # arguments for fzf
# CTRL-R --> History search using fuzzy search
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# CTRL-T --> Search file and folder inside root from any location
export FZF_CTRL_T_COMMAND="fd --hidden --exclude '.git' --exclude '.svn' . /"
export FZF_CTRL_T_OPTS="--preview-window right:50%:border --preview '(cat {} || tree -C {}) 2> /dev/null | head -200'"
# ALT-C  --> CD in any folder inside root from any location
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude '.git' --exclude '.svn' . /"
export FZF_ALT_C_OPTS="--preview-window right:50%:border --preview '(tree -C {}) 2> /dev/null | head -200'"



#-------------------------
# Autocomplete commands
#-------------------------
### Which autocomplete
complete -cf which

### Stack
eval "$(stack --bash-completion-script stack)"




#-------------------------
# Other
#-------------------------

# added by Pew
source "$(pew shell_config)"
