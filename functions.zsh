# Functions

# Weather forecast for the city passed as argument. Default is Paris.
# https://github.com/chubin/wttr.in.
wttr() { curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Paris}?2" }

# VScode the argument. Default is the current folder
c() { code ${1:-.} }

# Run Z plugin and VScode on the argument (current folder by default)
zc() { z ${1:-.}; c }

# Run Z plugin and Sublime on the argument (current folder by default)
zs() { z ${1:-.}; s }

# Lists the 10 most used terminal commands
stats() { fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10 }

# bxr runs bundle exec rspec Ruby test cases!
# takes an optional argument of a specific *.rb spec file
bxr() {
  clear
  if [[ $# -eq 0 ]]; then
    bundle exec rspec
  elif [[ $1 != *.rb ]]; then
    printf "Not a valid spec file: $1\n"
  else
    bundle exec rspec ${1:-}
  fi
}

# Launch a Ruby rdebug-ide Fast Debugger server
rdb() {
  if [[ $# -eq 0 ]]; then
    printf "Pass as argument the path of the file to debug\n"
  else
    rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 $1
  fi
}