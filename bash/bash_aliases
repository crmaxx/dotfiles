# For ssh autologins
   # TrueCrypt
   secret ()
   {
       local KEY="$1"
       local FILE="/Users/mzhukov/.ssh/ssh_passwords.db"
       echo -ne `awk '/^'$KEY'/ {print $2;exit}' $FILE` | pbcopy -l 1
       ssh $1
   }

   # GPG
   secret_gpg ()
   {
       local KEY="$1"
       local FILE="/Users/mzhukov/.ssh/ssh_passwords.db"
       echo -ne `gpg -o - $FILE | awk '/^'$KEY'/ {print $2;exit}'` | pbcopy -l 1
       ssh $1
   }

#   alias @="secret_gpg"
alias @="secret"

# My aliases for git
# Commit with message in subl
alias gca="git commit -a"
# Commit with message. Example 'gcm "Initial commit."'
alias gcm="git commit -m"
# To push all branches and tags
alias gpoat="git push origin --all --tags"
# Create a new branche. Example 'gnb static-pages'
alias gnb="git checkout -b" 
# Add file to git tree
alias ga="git add"
# Git checkout. Example 'gco master'
alias gco="git checkout"
alias gcom="git checkout master"
# Git merge. Example 'gm static-pages'
alias gm="git merge"
# Short status
alias gss="git status -s"
alias gls="git log --stat --max-count=5"
alias glg="git log --graph --max-count=5"
alias glag="git log --graph --decorate --all"
# Reset last git add/commit
alias grh="git reset HEAD"

# Customs for job
alias gpum="git push unfuddle master"
alias gpua="git push unfuddle  --all --tags"

# PG aliases
alias pg_start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

alias migrate="rake db:migrate && rake db:test:prepare && annotate"
alias tests="bundle exec rspec spec/ && bundle exec cucumber"
