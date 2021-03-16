export HISTSIZE=5000

# don't tell me bash is deprecated on macs
export BASH_SILENCE_DEPRECATION_WARNING=1

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[1;33m\]\u\[\e[m\]\[\e[1;33m\]@\[\e[m\]\[\e[1;34m\]\h\[\e[m\]\[\e[1;34m\]:\[\e[0m\]\[\e[35m\]\`parse_git_branch\`\[\e[m\]\[\e[36m\]\w\[\e[m\]\[\e[36m\]\\$\[\e[m\] "

export LSCOLORS="Exfxcxdxbxegedabagacad"
alias ls='ls -G'

# pyenv stuff
export PATH="/Users/ssharma/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export JUPYTER_PATH="${JUPYTER_PATH}:/Users/ssharma/.pyenv/bin"
export PATH="/Users/ssharma/.pyenv/bin:$PATH"
eval "$(pyenv virtualenv-init -)"

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# shortcut aliases
gitdir(){
	echo -e "Going to $HOME/Desktop/git\n"
	cd $HOME/Desktop/git
}

gitpushorigin(){
	CURRENT_BRANCH=`parse_git_branch | tr -d '[]\n'`
	if [ $current_branch == "master" ]; then 
		echo "Current branch is master, cannot push"   # prevent pushing directly to master
	else
		git push origin $current_branch
	fi
}


complete -C /usr/local/bin/terraform terraform
