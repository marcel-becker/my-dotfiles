#############################################################################################
# All key bindings:

# for m ($keymaps) bindkey -LM $m
# All ZLE user widgets

# zle -lL
# All zstyles:

# zstyle -L
# Loaded modules:

# zmodload -L
# All variables:

# typeset -p +H -m '*'
# With the zsh/parameters module loaded, that will also include aliases, options, functions...
#############################################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"

# use this to get color numbers.
# for code in {000..255}; do print -P -- "$code: %F{$code}Test%f"; done

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


autoload -Uz compinit promptinit
compinit
promptinit

# Customize to your needs...

# Start rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# Add homebrew to the completion path
fpath=("/usr/local/bin/" $fpath)

#echo PATH = "$PATH"
export PATH=~/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH
#echo PATH = "$PATH"
export PATH=/usr/local/opt/texinfo/bin:${PATH}
#echo PATH = "$PATH"
export PATH=$PATH:/Library/TeX/texbin # Add latex and tex executables
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/anaconda3/bin:$PATH"



# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Now we can pipe to multiple outputs!
setopt MULTIOS

# This makes cd=pushd
setopt AUTO_PUSHD

# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# No more annoying pushd messages...
# setopt PUSHD_SILENT

# blank pushd goes to home
setopt PUSHD_TO_HOME

# this will ignore multiple directories for the stack.  Useful?  I dunno.
setopt PUSHD_IGNORE_DUPS

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# use magic (this is default, but it can't hurt!)
setopt ZLE

setopt NO_HUP

# only fools wouldn't do this ;-)
#export EDITOR="subl -n -w"

setopt IGNORE_EOF

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL

# Keep echo "station" > station from clobbering station
setopt NO_CLOBBER

# Case insensitive globbing
setopt NO_CASE_GLOB

# Be Reasonable!
setopt NUMERIC_GLOB_SORT

# I don't know why I never set this before.
setopt EXTENDED_GLOB

# hows about arrays be awesome?  (that is, frew${cool}frew has frew surrounding all the variables, not just first and last
setopt RC_EXPAND_PARAM


# Do not ask for confirmation when deleting files.
setopt rm_star_silent
# Do not query the user before executing rm * or rm path/*.
setopt RM_STAR_SILENT


# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

bindkey "\eOP" run-help

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

# XTERM TITLE
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
      print -Pn '\e]2;[%n@%m]: %~\a'
}

function xterm_title_preexec () {
      print -Pn '\e]2;[%n@%m]: %~ %# '
      print -n "${(q)1}\a"
}

# set tab title to cwd
precmd () {
    tab_label=${PWD/${HOME}/\~} # use 'relative' path
    #echo -ne "\e]2;${tab_label}\a" # set window title to full string
    echo -ne "\e]1;${tab_label: -24}\a" # set tab title to rightmost 24 characters
}

if [[ "$TERM" == (screen*|xterm*|rxvt*) ]]; then
      add-zsh-hook -Uz precmd xterm_title_precmd
      add-zsh-hook -Uz preexec xterm_title_preexec
fi

unsetopt prompt_cr prompt_sp



source ~/.iterm2_shell_integration.zsh
iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

# Change tab color based on pwd.
function tab_color_precmd {
  ~/Dropbox/ZSH/change-tab-color-pwd 0.5 0.5
}
autoload -U add-zsh-hook
add-zsh-hook precmd tab_color_precmd

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


alias ls='ls -CFG'
alias his=history
alias h=history
alias rm="rm -i"
alias dps='docker ps'
alias pip-upgrade="pip freeze --local | grep -v '^\e' | cut -d = -f 1 | xargs pip install -U"
alias emacsnw='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias emacsnoinit='/Applications/Emacs.app/Contents/MacOS/Emacs -q'
alias spacemacs='HOME=~/Dropbox/spacemacs /Applications/Emacs27.app/Contents/MacOS/Emacs'


alias mvnver="mvn versions:display-dependency-updates versions:display-plugin-updates | grep 'INFO' | grep '>' | sort | uniq"
alias mvnclean="mvn dependency:purge-local-repository -DactTransitively=false -DreResolve=false"
alias profiledefault='iterm2profile Default'
alias profilessh1='iterm2profile Planx-In-A-Box'
alias profilessh2='iterm2profile Rspace-Distributed'
alias profilessh3='iterm2profile RemoteOpenstack'
## Use this to save the dot files in a github repo.
# mkdir ~/.dotfiles
#git init --bare $HOME/.dotfiles
alias configdot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# configdot remote add origin git@github.com:marcel-becker/my-dotfiles.git
# configdot config --local status.showUntrackedFiles no
#echo "alias configdot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
# Then use
# configdot status
# configdot add .vimrc
# configdot commit -m "Add vimrc"
# configdot add .bashrc
# configdot commit -m "Add bashrc"
# config push
# To get the files into a new system:
# echo ".cfg" >> .gitignore
# git clone --bare <git-repo-url> $HOME/.cfg
# config checkout
# config config --local status.showUntrackedFiles no

# Use the following to checkout dot files and backup old files
# git clone --bare git@github.com:marcel-becker/my-dotfiles.git $HOME/.dotfiles
# function config {
#    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
# }
# mkdir -p .dotfile-backup
# config checkout
# if [ $? = 0 ]; then
#   echo "Checked out config.";
#   else
#     echo "Backing up pre-existing dot files.";
#     configdot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfile-backup/{}
# fi;
# configdot checkout
# configdor config status.showUntrackedFiles no




# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Power Level 9k custom
# POWERLEVEL9K_TIME_BACKGROUND='32'
# POWERLEVEL9K_TIME_FOREGROUND='0'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='009'

POWERLEVEL9K_DIR_HOME_BACKGROUND='009'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='196'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='232'

#POWERLEVEL9K_VCS_CLEAN_FOREGROUND='099'
POWERLEVEL9K_MODE='awesome-fontconfig'

#Icon config
POWERLEVEL9K_HOME_ICON='\UF20E'
POWERLEVEL9K_SUB_ICON='\UF07C'
POWERLEVEL9K_FOLDER_ICON='\UF07B'
#POWERLEVEL9K_STATUS_OK_ICON='\UF2B0'
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\UE0BC'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\UE0BA'

# # Anaconda
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(anaconda battery)
# POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER='>'
# POWERLEVEL9K_ANACONDA_LEFT_DELIMITER='<'
# POWERLEVEL9K_ANACONDA_BACKGROUND='24'
# POWERLEVEL9K_ANACONDA_FOREGROUND='111'
# # POWERLEVEL9K_ANACONDA_ICON=''

# # Bateria
# POWERLEVEL9K_BATTERY_CHARGING='yellow'
# POWERLEVEL9K_BATTERY_CHARGED='blue'
# POWERLEVEL9K_BATTERY_LOW_THRESHOLD='20'
# POWERLEVEL9K_BATTERY_LOW_COLOR='red'
# POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='46'
# POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='235'
# POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='178'
# POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='235'
# POWERLEVEL9K_BATTERY_LOW_BACKGROUND='88'
# POWERLEVEL9K_BATTERY_LOW_FOREGROUND='235'
# POWERLEVEL9K_BATTERY_CHARGED_ICON='/UF240'
# POWERLEVEL9K_BATTERY_LOW_ICON='/UF240'
# POWERLEVEL9K_BATTERY_CHARGING_ICON='/UF1E6'
# POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='195'
# POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='009'
# POWERLEVEL9K_BATTERY_ICON='\UF1E6'
