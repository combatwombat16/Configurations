#User Config
umask 002
export PS1='[\u@\h:\w]\n$'
set -o ignoreeof
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob


#Exports
export EDITOR=/usr/bin/vim

if [ `uname -n` == "BABRAMS-LX01" ]; then
	export JAVA_HOME=/opt/jdk1.7.0_06
	export SCALA_HOME=/opt/scala-2.9.2
	export SPARK_HOME=/opt/spark-0.6.1
	export HIVE_HOME=/opt/hive-0.9.0-bin
	export M2_HOME=/usr/share/maven
	export FW_HOME=/opt/FWTools-2.0.6
	export SBT_HOME=/opt/sbt
	export ORACLE_BASE=/usr/lib/oracle
	export ORACLE_HOME=${ORACLE_BASE}/11.2/client64
	export TNS_ADMIN=${ORACLE_HOME}/network/admin
	export MALLET_HOME=/opt/mallet-2.0.7
	export LD_LIBRARY_PATH=${ORACLE_HOME}/lib
	export LIB_HOME=/home/babrams/lib
	export PATH=${PATH}:${SCALA_HOME}/bin:${JAVA_HOME}/bin:${M2_HOME}/bin:${FW_HOME}/bin_safe:${SBT_HOME}/bin:${ORACLE_HOME}/bin:${MALLET_HOME}/bin
	export CLASSPATH=${CLASSPATH}:/opt/mysql-connector-java-5.1.21/mysql-connector-java-5.1.21-bin.jar
elif [ `uname -n` == "credsna01vcsa01" ];then
	export JAVA_HOME=/usr/java/latest
	export SCALA_HOME=/usr/local/scala-2.9.2
	export LIB_HOME=/export/home/babrams/lib
	export TERM=xterm-256color
	export PATH=${PATH}:${JAVA_HOME}/bin:${SCALA_HOME}/bin
else
	export JAVA_HOME=/usr/java/latest
	#export SCALA_HOME=
	export LIB_HOME=/export/home/babrams/lib
	export TERM=xterm-256color
	export ORACLE_BASE=/u01/app/oracle
	export ORACLE_HOME=${ORACLE_BASE}/product/11.2.0/client_1
	export TNS_ADMIN=${ORACLE_HOME}/network/admin
	export PATH=${PATH}:${JAVA_HOME}/bin:${ORACLE_HOME}/bin
fi

#Aliases
alias ls='ls -h --color=auto'
alias ll='ls -la'
alias lt='ll -t'
alias lr='lt -r'
alias vi='vim'
alias grep='grep --color -E'
alias du='du -h'
alias df='df -h'
alias scala9="/opt/scala-2.9.2/bin/scala -J-Xmx5G -classpath $(echo ${LIB_HOME}/*.jar | tr ' ' ':')" #-classpath $(echo ${SCALA_HOME}/lib/*.jar | tr ' ' ':')"
alias scala10="/opt/scala-2.10.1/bin/scala -J-Xmx5G -classpath $(echo ${LIB_HOME}/*.jar | tr ' ' ':')" #-classpath $(echo ${SCALA_HOME}/lib/*.jar | tr ' ' ':')"
alias spark="$SPARK_HOME/spark-shell"
alias sparkRun="$SPARK_HOME/run"

if [ `uname -n` == "BABRAMS-LX01" ]; then
	alias vnc='java -jar /opt/tvnc_Java/tightvnc-jviewer.jar'
	alias clearSwap='sudo swapoff -a && sudo swapon -a'
	#alias top='htop'
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
