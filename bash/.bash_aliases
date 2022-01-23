

# https://github.com/mscott3k/scripts/blob/main/home/bash_aliases

alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/$/¶/g'"
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -lh --time-style=long-iso"
alias la="ll -A"
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias path="echo \$PATH"
alias fstab="gksudo gedit /etc/fstab"
alias open="xdg-open"
alias trash="trash-put"  # requires trash-cli package
#alias rm="trash"  # affects other aliases and funcions
alias mand="dwww-man"
alias package="dpkg-www"
alias ca="CA.pl"
alias dd-progress="dd status=progress bs=1M iflag=count_bytes"
alias dd-nocache="dd-progress oflag=nocache,sync"
alias dfd='df -H -x tmpfs -x squashfs -x devtmpfs'
alias duh='du -sbh --si'
alias dud='lsblk --exclude 7'  # 7 = loop devices, most likely snaps
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
#alias json='python3 -m json.tool'  # 'jq' is a beter alternative, if installed
alias why='apt rdepends --installed'  # can also be 'aptitude why'

install_packages() {
	# Avoid marking installed packages as manual by only installing missing ones
	local pkg=
	local pkgs=()
	for pkg in "$@"; do
		if ! package_installed "$pkg"; then pkgs+=( "$pkg" ); fi
	done
	if (("${#pkgs[@]}")); then
		sudo apt install "${pkgs[@]}"
	fi
}

package_version() {
	dpkg-query --showformat='${Version}' --show "$1" 2>/dev/null
}

package_installed() {
	local ok
	ok=$(package_version "$1") && [[ "$ok" ]]
}

apt-list-manual() {
	# https://askubuntu.com/a/492343/11015
	local manifest=${1:-}
	local initial=/var/log/installer/initial-status.gz
	local list=
	# User-provided manifest, assume same format as https://releases.ubuntu.com
	if [[ "$manifest" ]]; then
		list=$(awk '{print $1}' "$manifest") || {
			echo "Usage: apt-list-manual [MANIFEST-FILE]" >&2
			return
		}
	# List from system installer log
	elif [[ -f "$initial" ]]; then
		list=$(gzip -dc "$initial" | sed -n 's/^Package: //p')
	fi

	# List packages
	comm -23 <(apt-mark showmanual | sort -u) <(echo "$list" | sort -u)

	# If initial log not found and no manifest provided, show download instructions
	if [[ "$list" ]]; then
		return
	fi
	printf 'ERROR:' >&2

	# numeric version including with point release: 20.04.3
	local version=$(awk -F'="?| ' '/^VERSION=/{print $2}' /etc/*release)
	local msg=(
		"Empty or missing manifest file: ${manifest:-$initial}"
		"Is this a server? Without a manifest the above list is not accurate."
		"Download it from: http://releases.ubuntu.com/${version}/"
		"And try again with: apt-list-manual MANIFEST-FILE"
	)
	printf '\t%s\n' "${msg[@]}" >&2
}

pyprofile() {
	(($#)) || { echo "Usage: pyprofile <COMMAND> [ARGS...]" >&2; return 1; }
	python -m cProfile --sort=time "$@" |
	{ awk -v l=$((LINES-10)) '/ncalls  tottime/{t=l}t==1{exit}t>0{t--}{print}'
	cat - >/dev/null; }
}
pyprofile3() {
	(($#)) || { echo "Usage: pyprofile3 <COMMAND> [ARGS...]" >&2; return 1; }
	python3 -m cProfile --sort=time "$@" |
	{ awk -v l=$((LINES-10)) '/ncalls  tottime/{t=l}t==1{exit}t>0{t--}{print}'
	cat - >/dev/null; }
}

PATH=$PATH:/home/abakus/.local/bin
