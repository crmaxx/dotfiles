# For ssh autologins

# w\o crypto
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

#alias @="secret_gpg"
alias @="secret"