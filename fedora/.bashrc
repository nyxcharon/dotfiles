# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [[ ${EUID} == 0 ]] ; then
    sq_color="\[\033[0;31m\]"
else
    sq_color="\[\033[0;34m\]"
    fi

PS1="$sq_color\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[01;37m\]\342\234\227$sq_color]\342\224\200\")[\[\033[01;37m\]\t$sq_color]\342\224\200[\[\033[01;37m\]\u@\h$sq_color]\n\342\224\224\342\224\200\342\224\200> \[\033[01;37m\]\W$sq_color $ \[\033[01;37m\]\\[\\033[0m\\] "

unset sq_color

export EDITOR="emacs -nw"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias emacs="emacs -nw"
alias clean=' find `pwd` -iname "*~" -or -name "*#" |xargs rm -f'
