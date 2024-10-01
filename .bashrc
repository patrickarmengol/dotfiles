#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
PS1='[\[\e[36m\]\u\[\e[0m\]@\[\e[32m\]\h\[\e[0m\] \[\e[33m\]\W\[\e[0m\]]\[\e[35m\]\\$\[\e[0m\] '

HISTTIMEFORMAT='%F %T '


#---------------------------------------------------------

# listings
alias ls='eza'
alias ll='eza -la'

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


# update pacman mirrorlist
alias rf='sudo reflector --country TW --protocol https --sort rate --save /etc/pacman.d/mirrorlist'


# purge orphaned + cycledep packages
alias purgeorphans='sudo pacman -Qdtq | sudo pacman -Rns -; sudo pacman -Qqd | sudo pacman -Rsu --print -'


# clean pacman cache
alias cleancache='sudo paccache -rk1; sudo paccache -ruk0'

#---------------------------------------------------------

# shell wrapper for changing working directory when exiting yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
