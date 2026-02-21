#auto suggest the $PATH binaries
autoload -U compinit
zstyle ':completion:*' rehash true  # Auto-update commands
compinit -d ~/.zcompdump

#https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#homebrew
#i don't like these autosuggestions
#source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# i don't know why i aliased them, also gcc-14 no longer on system, we have gcc-15 
#alias gcc='gcc-14'
#alias g++='g++-14'

#setting mysql path
export PATH=${PATH}:/opt/homebrew/opt/mysql@8.4/bin
# mysql -u ayushrawat -p
# mysql -u root -p

#setting java home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-25.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
export PATH=${JAVA_HOME}:${PATH}

#SDKROOT for gcc compiler /usr/include
# after macos update, it doesn't need sdkroot anymore, proving it will create an library mismatch issue
# export SDKROOT=`xcrun --show-sdk-path`
alias gcc14='/opt/homebrew/bin/g++-14 -o cpp'
#alias cc='/opt/homebrew/bin/g++-14'
alias la='ls -lah --color=auto'

#PYTHON3
alias python='python3'
alias py='python3'

# set RUST... not sure what's the difference between export PATH=$PATH:$PATH_TO_BINARIES and . $PATH_TO_BINARIES 
. "$HOME/.cargo/env"

# HOMEBREW FLAGS
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

# --- SETUP PS1 ---
# PS1='%n@%m:%~ %# '
# load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'

# this allows the variable to update dynamically
setopt PROMPT_SUBST

NEW_PS1='%F{green}%n@%m%f:%F{blue}%~%f%F{yellow}${vcs_info_msg_0_}%f $ '
export PS1="$NEW_PS1"
# --- ---

# setting go path... go env
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOMODCACHE=$HOME/go/pkg/mod
export PATH=$PATH:$GOROOT/bin:$GOBIN

# postgresql path
# brew services start postgresql@17
export PATH=$PATH:"/opt/homebrew/opt/postgresql@17/bin"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"

# GROOVY HOME
export GROOVY_HOME=/opt/homebrew/opt/groovy/libexec

#JEXTRACT
export PATH=$PATH:"/Users/ayushrawat/soft/jextract-25/bin"

# SET FILEBEAT PATH
alias filebeat='/Users/ayushrawat/soft/filebeat/filebeat'

###################################################
#                 FUNCTIONS                       #
###################################################

function port() { ps -ef | grep $1;}

function up() {
    local n=${1:-1};
    for ((i=1; i<=n; i++)); do
        cd .. || return
    done
}

#fzf 
source <(fzf --zsh)

#go:=9.8m/s2,$PATH:$JAVA_HOME,const_Pie:=3.14


. "$HOME/.local/bin/env"
