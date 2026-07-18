#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
fastfetch

#school OOP course stuff
export JAVA_HOME="/usr/lib/jvm/jdk-25.0.2"
export ANT_HOME="/usr/share/ant/apache-ant-1.10.14"

#Main Path
export PATH=$PATH:/home/Atlas/.spicetify:$HOME/opt/gcc-15.2.0/bin:$HOME/opt/cross/bin:$PATH:$HOME/Desktop/Applications:$PATH:$JAVA_HOME/bin:$PATH:$ANT_HOME/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

