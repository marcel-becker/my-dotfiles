# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#echo "Now Executing .bashrc"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=400000000
export HISTSIZE=20000
export HISTTIMEFORMAT="%d/%m/%y %T "
export PROMPT_COMMAND="history -a; history -c; history -r $PROMPT_COMMAND"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

source ~/.git-prompt.sh
source ~/.git-completion.bash
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[1;32m\][\@][\u@\h]\[\033[00m\]:\[\033[01;32m\][\w]\[\033[1;31m\]$(__git_ps1) \[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    # PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\] $PS1"
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\h:\w\a\] $PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -F --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi


# The colors can be set with the LSCOLORS variable. The color designators are as follows:
# a     black
# b     red
# c     green
# d     brown
# e     blue
# f     magenta
# g     cyan
# h     light grey
# A     bold black, usually shows up as dark grey
# B     bold red
# C     bold green
# D     bold brown, usually shows up as yellow
# E     bold blue
# F     bold magenta
# G     bold cyan
# H     bold light grey; looks like bright white
# x     default foreground or background
# Note that the above are standard ANSI colors.
# The actual display may differ depending on the color capabilities of the terminal in use.
# The order of the attributes in the LSCOLORS variable is as follows:
# directory
# symbolic link
# socket
# pipe
# executable
# block special
# character special
# executable with setuid bit set
# executable with setgid bit set
# directory writable to others, with sticky bit
# directory writable to others, without sticky bit
# They are set in pairs, foreground (f) then background (b), i.e.
# fbfbfbfbfbfbfbfbfbfbfb for all 11 settings.
# The default is exfxcxdxbxegedabagacad,
# i.e. blue foreground and default background for regular directories, black foreground and red background for setuid executables, etc.

export CLICOLOR=1
# use yellow for directories
export LSCOLORS=exfxcxdxbxegedabagacad


# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
alias ls='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

export PATH=~/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:~/.chefdk/gem/ruby/2.1.0/bin:$PATH
export USE_CCACHE=1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:/Library/TeX/texbin # Add latex and tex executables
export M3_HOME=/usr/local/Cellar/maven/3.3.9
export PATH=${M3_HOME}/bin:${PATH}
export PATH=/home/becker/src/play-2.2.0/:${PATH}
export PATH=/opt/chef/embedded/bin:${PATH}



alias his=history
alias h=history
alias rm="rm -i"

export APAC_HOME="/Users/marcelbecker/src/droidsafe-git"
export ANDROID_SDK_HOME="/Users/marcelbecker/src/android-sdk-macosx"
export JAVA_HOME=$(/usr/libexec/java_home)
#export JAVA_HOME=/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"


##################################
# Colors
#################################
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensty
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensty
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensty backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[10;95m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White

#PS1="${debian_chroot:+($debian_chroot)}\[$BGreen\][\@][\u@\h]\[$Color_Off\]:\[$BGreen\][\w]\[$Color_Off\] \$ "




##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
bash_prompt_command() {
    #echo 'Setting bash prompt command'
    # How many characters of the $PWD should be kept
    local pwdmaxlen=25
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}


bash_prompt() {
    case $TERM in
     xterm*|rxvt*)
         local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
          ;;
     *)
         local TITLEBAR=""
          ;;
    esac
    local NONE="\[\033[0m\]"    # unsets color to term's fg color

    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white

    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"

    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"

    local UC=$EMG                 # user's color
    [ $UID -eq "0" ] && UC=$EMR   # root's color

    #echo 'Setting bash prompt'
    PS1="$TITLEBAR${UC}[\@][\u@\h]${NONE}:${UC}[\${NEW_PWD}]${EMY}\$(__git_ps1 '(%s)') \\$ ${NONE}"
    # without colors: PS1="[\u@\h \${NEW_PWD}]\\$ "
    # extra backslash in front of \$ to make bash colorize the prompt
}


PROMPT_COMMAND="$PROMPT_COMMAND; bash_prompt_command"
bash_prompt
unset bash_prompt


# MySQL and FlockDB vars
export DB_USERNAME="root"
export DB_PASSWORD="root"
alias kill-flock='curl localhost:9990/shutdown && ps -ef | grep flock | while read n1 n2 n3 ; do kill -9  $n2 ;  done'

export SPECWARE4="/home/becker/src/specware"
export SPECWARE_INIT_FORM="NIL"
export APAC_HOME="/home/becker/src/droidsafe-git"
export ANDROID_SDK_HOME="/home/becker/src/Android-SDK/android-sdk-linux"

#export PATH=${HOME}/.rbenv/bin:${PATH}
#eval "$(rbenv init -)"
export BERKSHELF_PATH=~/.berkshelf

export LUA_PATH='/opt/local/share/luarocks/share/lua/5.2/?.lua;/opt/local/share/luarocks/share/lua/5.2/?/init.lua;/Users/marcelbecker/.luarocks/share/lua/5.2/?.lua;/Users/marcelbecker/.luarocks/share/lua/5.2/?/init.lua;/opt/local/share/lua/5.2//?.lua;/opt/local/share/lua/5.2//?/init.lua;/opt/local/share/lua/5.2/?.lua;/opt/local/share/lua/5.2/?/init.lua;/opt/local/lib/lua/5.2/?.lua;/opt/local/lib/lua/5.2/?/init.lua;./?.lua'
alias test-speed='cd /tmp; rm -rf rvm-stable* ; time wget -a wget.log http://repo.px.net/software/rvm-stable.tar.gz'
alias copy-pem='scp -i ~/.vagrant.d/less_insecure_private_key vagrant@33.33.33.11:/home/vagrant/.chef/*.pem ~/.chef/'

export LUA_CPATH='/opt/local/share/luarocks/lib/lua/5.2/?.so;/Users/marcelbecker/.luarocks/lib/lua/5.2/?.so;/opt/local/lib/lua/5.2/?.so;/opt/local/lib/lua/5.2/loadall.so;./?.so'
export RABBIT_IP='33.33.33.22'
export MONGO_DATABASE_IP='33.33.33.23'
export STATSD_IP='33.33.33.20'

# to increase mouse speed on ubuntu
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    xset m 20 1
fi

# fix ubuntu disappearing mouse.
#gsettings set org.gnome.settings-daemon.plugins.cursor active false

#export M3_HOME='/usr/share/maven'

alias git-update-all='find . -maxdepth 1 -type d -print -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;'
alias git-update-all='find . -maxdepth 1 -type d -print -exec git --git-dir={}/.git --work-tree=$PWD/{} pull \;'

# For Python Virtual Envs
# $ pip install virtualenvwrapper
# $ export WORKON_HOME=~/Envs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
# $ mkvirtualenv venv
# $ workon venv
# $ deactivate
# $ rmvirtualenv venv
# lsvirtualenv
# List all of the environments.
# cdvirtualenv
# Navigate into the directory of the currently activated virtual environment, so you can browse its site-packages, for example.
# cdsitepackages
# Like the above, but directly into site-packages directory.
# lssitepackages
# Shows contents of site-packages directory.
export WORKON_HOME=~/PythonEnvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--always-copy'
export WORKON_HOME=~/PythonEnvs
source /usr/local/bin/virtualenvwrapper.sh

function title ()
{
    TITLE=$*;
    /bin/echo "Title = ${TITLE}"
    #export PROMPT_COMMAND='"\033]0;${TITLE*/}\007" ':"$PROMPT_COMMAND";
    export PROMPT_COMMAND='echo -ne "\033]0;${TITLE###*/}\007" '
}

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

alias kill-px='ps -aux | grep px | while read n1 n2 n3 ; do sudo kill -9 $n2 ; done && ps -aux | grep px'

alias clear-bridge='cd /proc/sys/net/bridge && for i in `ls` ; do sudo echo 0 > $i ; done'

alias dps='docker ps'

alias pip-upgrade="pip freeze --local | grep -v '^\e' | cut -d = -f 1 | xargs pip install -U"

dbash () {
    docker exec -it "$1" bash;
}

alias emacsnw='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias emacsnoinit='/Applications/Emacs.app/Contents/MacOS/Emacs -q'

alias mvnver="mvn versions:display-dependency-updates versions:display-plugin-updates | grep 'INFO' | grep '>' | sort | uniq"
alias mvnclean="mvn dependency:purge-local-repository -DactTransitively=false -DreResolve=false"

function iterm_tab_color {
    case $1 in
        green)
            echo -e "\033]6;1;bg;red;brightness;57\a"
            echo -e "\033]6;1;bg;green;brightness;197\a"
            echo -e "\033]6;1;bg;blue;brightness;77\a"
            ;;
        red)
            echo -e "\033]6;1;bg;red;brightness;270\a"
            echo -e "\033]6;1;bg;green;brightness;60\a"
            echo -e "\033]6;1;bg;blue;brightness;83\a"
            ;;
        orange)
            echo -e "\033]6;1;bg;red;brightness;227\a"
            echo -e "\033]6;1;bg;green;brightness;143\a"
            echo -e "\033]6;1;bg;blue;brightness;10\a"
            ;;
        *)
            echo -e "\033]6;1;bg;*;default\a"
            ;;
    esac
}
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
