# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
export LD_LIBRARY_PATH="/opt/gcc/x86_64/9.2.0a/lib:/opt/gcc/x86_64/9.2.0a/lib64"

ISDOCKER=`cat /proc/1/cgroup | grep docker | wc -l`
if [ "$ISDOCKER" == "0" ]; then
gnbroot="/var/fpwork/h4hu/gnb"
else
gnbroot="/workspace/"
fi
 

alias akwalk='ak_walk(){
file=`$1`
action=$2
#for item in $file;  do echo "$item" ;done
for item in $file;  do $action $item" ;done
 } 
ak_walk'

alias akbuild='_b(){
case $1 in 
 l2ps|ps) 
   echo "==========try to build $1============" 
   5gg && up && source L2-PS/setup.sh --target=asik-x86_64-ps_lfs-gcc9 && ./buildscript/L2-PS/run build
   ;;
 l2pssct|sct) 
   echo "==========try to build $1============" 
   5gg&&up&& source L2-PS/setup.sh --target=asik-x86_64-ps_lfs-dynamic-linker-on-gcc9 &&  mkdir -p build/tickler && cd build/tickler && cmake -GNinja ../../sct/tickler -DUNITTESTS_ENABLED=ON -DSCT_COMP_L2PS=ON && ninja -j $PARALLEL_BUILD_JOBS check_l2ps
;; 
 l2psut) 
   echo "==========try to build $1============" 
   5gg && source L2-PS/setup.sh --target=asik-x86_64-ps_lfs-dynamic-linker-on-gcc9 && ./buildscript/L2-PS/run ut_build && ./buildscript/L2-PS/run ut_run
   ;;
 l2pscmpr) 
   echo "==========try to build $1============" 
   source L2-PS/setup.sh --target=cmpr && ./buildscript/L2-PS/run build
   ;;
 l2psfuse) 
   echo "==========try to build $1============" 
   5gg&&up&& source L2-PS/setup.sh --target=asik-x86_64-ps_lfs-gcc9 && buildscript/L2-PS/run sct_build --for-fuse-target
   ;;
 l2pstarget) 
   echo "==========try to build $1============" 
   5gg && up && source L2-PS/setup.sh --target=asik-x86_64-ps_lfs-gcc9 && buildscript/L2-PS/run sct_build --for-target
   ;;
 l2pspack) 
   echo "==========try to build $1============" 
   up && ./buildscript/L2-PS/run package
   ;;
 *)
   echo "Supported parameter [l2ps/l2psut/l2pssct/l2pscmpr/l2psfuse/l2pstarget/l2pspack]" ;;
 esac
 };
_b'
alias l='ls'
alias lll='ls -ahlt'
alias llll='ls -ahls'
alias gnb='cd $gnbroot'
alias up='cd $gnbroot/uplane/'
alias h4='cd /var/fpwork/h4hu/'
alias tt='tmux attach -t 0'
alias clion='cd /var/fpwork/${USER}/gnb/uplane && 5gg && source L2-PS/setup.sh --target=asik-x86_64-ps_lfs-dynamic-linker-on-gcc9 && clion.sh'
alias rmd='rm -rf'
alias getcode='git clone "ssh://h4hu@gerrit.ext.net.nokia.com:29418/MN/5G/NB/gnb" && (cd "gnb" && gitdir=$(git rev-parse --git-dir); curl -o ${gitdir}/hooks/commit-msg https://gerrit.ext.net.nokia.com/gerrit/static/commit-msg ; chmod +x ${gitdir}/hooks/commit-msg)'
alias 5gg='source $gnbroot/set_gnb_env.sh '
alias 5g='source $gnbroot/set_gnb_env.sh '
alias pp="git push origin HEAD:refs/for/master"
alias gsubmodule='gnb && rm -rf ./externals/*&&git checkout externals/ && git submodule sync && git submodule update --init --recursive'
alias losct="source L2-LO/setup.sh --target=asik-x86_64-ps_lfs-dynamic-linker-on && buildscript/L2-LO/run build && buildscript/L2-LO/run sct_build "
alias lo="source L2-LO/setup.sh --target=asik-x86_64-ps_lfs && ./buildscript/L2-LO/run build"
alias l2hi="source L2-HI/set_build_env.sh build_asik && ./buildscript/L2-HI/run build"
alias l2hicmpr="source L2-HI/set_build_env.sh build_cmpr && ./buildscript/L2-HI/run build"
alias l2hisct="source L2-HI/set_build_env.sh sct_asik_host && ./buildscript/L2-HI/run sct_build"
alias l2hiut="source L2-HI/set_build_env.sh ut && ./buildscript/L2-HI/run ut_build"
alias l2rtcommon='5gg && up && source L2-PS/setup.sh --target=asik-x86_64-ps_lfs-gcc9 && ./buildscript/L2-RT_common/run build && ./buildscript/L2-RT_common/run package'
#alias pre="git log  --pretty=format:'%ci %h %s    ||| %C(green)<%an> %ae%Creset' "
alias pre="git log  --pretty=format:'%ci %h %s %C(green)[%an]' "
alias ss="source ~/.bashrc"
#alias gt="export cur=`pwd` && gtags --skip-symlink=d -O>/dev/null && if [ ! -f "GPATH" ]; then ln -s /tmp`pwd`/GRTAGS GRTAGS && ln -s /tmp`pwd`/GPATH GPATH && ln -s /tmp`pwd`/GTAGS GTAGS; fi &"
alias gt="export cur=`pwd` && gtags -O>/dev/null && if [ ! -f "GPATH" ]; then ln -s /tmp`pwd`/GRTAGS GRTAGS && ln -s /tmp`pwd`/GPATH GPATH && ln -s /tmp`pwd`/GTAGS GTAGS; fi &"
alias gtc="rm -f GRTAGS GTAGS GPATH"
alias genjson="sed "s#/var/fpwork/h4hu#C:/Users/h4hu/git#g" build/l2_ps/build/compile_commands.json > compile_commands.json"
alias gits='git status'
alias gg='git log'
alias gfetch='git clone "ssh://h4hu@gerrit.ext.net.nokia.com:29418/MN/5G/NB/gnb" && (cd "gnb" && gitdir=$(git rev-parse --git-dir); curl -o ${gitdir}/hooks/commit-msg https://gerrit.ext.net.nokia.com/gerrit/static/commit-msg ; chmod +x ${gitdir}/hooks/commit-msg)'
alias gitca='git commit --amend'
alias gitcan='git commit --amend --no-edit'
export cmprdst=10.57.233.84:/user/toor4nsn/
export PARALLEL_BUILD_JOBS=16
alias cleantheshell='export > ~/.tmpexport && for it in `cat ~/.cleanshell.tmp ~/.tmpexport | cut -d "=" -f 1 | sort | uniq -u | cut -d " " -f 3`; do unset $it 2>&-; done'
alias cs='export > /home/h4hu/.tmpexport && for it in `cat ~/.cleanshell.tmp ~/.tmpexport | cut -d "=" -f 1 | sort | uniq -u | cut -d " " -f 3`; do unset $it 2>&-; done'
alias chgnb='unset gnbroot &&  gnbroot=`readlink -f ./`'
#export TMPDIR=/var/fpwork/h4hu/tmp
#PATH=/home/h4hu/soft/bin/bin:/home/h4hu/soft/bin:/opt/tmux/x86_64/1.9a/bin-wrapped/:/home/h4hu/clion-2020.2.4/bin:${PATH}:/home/h4hu/soft/bin/
PATH=/home/h4hu/soft/bin/bin:/home/h4hu/soft/bin:/opt/tmux/x86_64/1.9a/bin-wrapped/:/home/h4hu/clion-2020.2.4/bin:${PATH}:/home/h4hu/soft/bin/
########ECE_HZH_SQG05###############

#source seesetenv -n ant ant=1.9.7
#source seesetenv -n j2se j2se=1.8.0_92
#source seesetenv -n python python=2.7.11
#source seesetenv -n python3 python3=3.5.1
#source seesetenv -n llvm llvm=5.0.0.g610

export https_proxy=http://10.144.1.10:8080
export http_proxy=http://10.144.1.10:8080
export no_proxy=localhost,127.0.0.0/8,*.local,nsn-net.net,inside.nokiasiemensnetworks.com,access.nokiasiemensnetworks.com,nsn-intra.net,nsn-rdnet.net,nokia.com,alcatel-lucent.com

function who_login {
    login_total=`who | cut -d ' ' -f 1 | sort | uniq | wc -l`
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
      echo "/$branch"
  fi
}

function load_avg {
    avg_val="`cat /proc/loadavg | cut -d ' ' -f 1 | cut -d '.' -f 1`"
    echo "$avg_val%"
}

#export PS1='[\u@$(host_name)/$(who_login) \W][$(load_avg)]\$'
export PS1='[$(who_login)/$(load_avg) \W]\$'
######################
#GNB_ENV=$gnbroot/set_gnb_env.sh 
#if [ -f $GNB_ENV ];then
#source $GNB_ENV 
#fi

#if [ "${G5HASBEENSET}" == "" ];then
#export G5HASBEENSET=YES
##/5g/usde/scripts/setup_unified_sde.sh  gnb
#fi
##############END##################
# User specific aliases and functions
#source /opt/EE_LinSEE/bin/seesetenv LINSEE_5G_TOOLS-4.0.1
##

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
fi
#rm ~/.vscode-server/.[a-z0-9]*.log>/dev/null

export TERM=xterm
export > .cleanshell.tmp

