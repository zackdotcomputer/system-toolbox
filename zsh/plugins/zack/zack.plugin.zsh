# Zack's zsh plugin
# author: https://github.com/zackdotcomputer

# Shared-shell (bash or zsh or...) terminal tweaks and productivity commands

# Set up better alias commands for ls/ll
alias ls='ls -G'
alias ll='ls -hl'

# Git "frequently used commands"
alias gs="git status"
alias gg="git grep"

# Pretty formatting compact git log from @jorgeo
alias glow="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# Push current branch to origin without git's "set upstream!" annoyances
# alias gpb="git rev-parse --abbrev-ref HEAD | xargs -n 1 git push origin"

# Push current branch to origin and open a pull request (requires github's hub command)
alias gipper="ggp && open \`hub pull-request\`"

#function squash-killer { git checkout -q $1 && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base develop $branch) && [[ $(git cherry develop $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done }
function squash-killer-main { git checkout -q $1 && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base main $branch) && [[ $(git cherry main $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done }

alias be='bundle exec'

# Define UTF-8 as our terminal language to ensure emoji support!
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
