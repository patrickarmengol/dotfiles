#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

HISTTIMEFORMAT='%F %T '


#---------------------------------------------------------

# listings
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -A'

# better tree
alias tree='tree -C --dirsfirst'

# list mounted drives
alias mntd='mount | awk -F" " "{ printf \"%s\t%s\n\",\$1,\$3; }" | column -t | grep -E ^/dev/ | sort'

# list largest files in working directory
alias largest='du -h -x -s -- * | sort -r -h | head -20'

# mkdir with make parent directories + verbose
alias mkdir='mkdir -p -v'


# python init venv
alias vinit='python -m venv .venv; source .venv/bin/activate'

# python activate venv
alias va='source .venv/bin/activate'

# python deactivate venv
alias vd='deactivate'


# nvim vim
alias vim='nvim'


# ping check
alias pc='ping -c 5 1.1.1.1'


# grep bash history
alias hg='history | grep'


# managing dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'


alias rf='sudo reflector --country KR --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

#---------------------------------------------------------


