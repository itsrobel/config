function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}


run "emacs --daemon"