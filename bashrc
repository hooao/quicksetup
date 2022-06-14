# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
export LD_LIBRARY_PATH="/opt/gcc/x86_64/9.2.0a/lib:/opt/gcc/x86_64/9.2.0a/lib64:/home/h4hu/soft/lib"
if [ -f ~/.nberc ]; then
	. ~/.nberc
fi
if [ -f ~/.extra_bashrc ]; then
    ccache_check=`which ccache 2>/dev/null`
#    if [ "$ccache_check" != "" ]; then
        . ~/.extra_bashrc
#    fi
fi


#export TMPDIR=/var/fpwork/h4hu/tmp
#PATH=/home/h4hu/soft/bin/bin:/home/h4hu/soft/bin:/opt/tmux/x86_64/1.9a/bin-wrapped/:/home/h4hu/clion-2020.2.4/bin:${PATH}:/home/h4hu/soft/bin/
PATH=/home/h4hu/soft/bin/bin:/home/h4hu/soft/bin:/opt/tmux/x86_64/1.9a/bin-wrapped/:/home/h4hu/clion-2020.2.4/bin:${PATH}:/home/h4hu/soft/bin/
########ECE_HZH_SQG05###############

#source seesetenv -n ant ant=1.9.7
#source seesetenv -n j2se j2se=1.8.0_92
#source seesetenv -n python python=2.7.11
#source seesetenv -n python3 python3=3.5.1
#source seesetenv -n llvm llvm=5.0.0.g610

export https_proxy=http://10.158.100.8:8080
export http_proxy=http://10.158.100.8:8080
export no_proxy=localhost,127.0.0.0/8,*.local,nsn-net.net,inside.nokiasiemensnetworks.com,access.nokiasiemensnetworks.com,nsn-intra.net,nsn-rdnet.net,nokia.com,alcatel-lucent.com

function who_login {
    login_total=`who | awk '{print $1}' | sort | uniq | wc -l`
    echo "$login_total"
}

function host_name {
    new_host="`echo $HOSTNAME | cut -d "." -f 1 | tr -cd "[0-9]"`"
    if [ "${new_host}" == "" ];then
        new_host="\h"
    fi
    echo "$new_host"
}

function git_branch {
  branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
  if [ "${branch}" != "" ];then
      if [ "${branch}" = "(no branch)" ];then
          branch="(`git rev-parse --short HEAD`...)"
      fi
      echo "<${branch}>"
  fi
}

function load_avg {
#    avg_val="`cat /proc/loadavg | cut -d ' ' -f 1 | cut -d '.' -f 1`"
    avg_val=`cat /proc/loadavg | awk '{print int($1),int($3)}'`
    echo "${avg_val}"
}

function print_docker {
    if [ "$ISDOCKER" != "0" ]; then
        echo " dk:"
    fi
}
#export PS1='[\u@$(host_name)/$(who_login) \W][$(load_avg)]\$'
export PS1='[$(who_login):$(print_docker) \W]$(git_branch)\$ '

##git###
export EDITOR=vim #set git default editor
[[ -s /home/h4hu/.autojump/etc/profile.d/autojump.sh ]] && source /home/h4hu/.autojump/etc/profile.d/autojump.sh

##vim##
export FZF_DEFAULT_OPTS="--height 80% --layout=reverse --preview 'cat {} 2> /dev/null | head -500'"
##gtags##
export MAKEOBJDIRPREFIX=/tmp/
##vscode##
if [ "$ISDOCKER" == "0" ]; then
mkdir -p /var/fpwork/h4hu/vscode-server
mkdir -p /var/fpwork/h4hu/tmp 
fi
export TERM=xterm
# save current environment
#export > .cleanshell.tmp

. "$HOME/.cargo/env"
unset MAILCHECK
