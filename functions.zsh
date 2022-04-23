#!/bin/sh

# Weather forecast for the city passed as argument. Default is Paris.
# https://github.com/chubin/wttr.in.
wttr() { curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Paris}?2" }

# VScode the argument. Default is the current folder
c() { code ${1:-.} }

# Run Z plugin and VScode on the argument (current folder by default)
zc() { z ${1:-.}; c }

# Run Z plugin and Sublime on the argument (current folder by default)
zs() { z ${1:-.}; s }

# Lists the 15 most used terminal commands
stats() {
  fc -l 1 |
  awk '{CMD[$2]++;count++;} END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' |
  grep -v "./" |
  column -c3 -s " " -t |
  sort -nr | nl | head -n15
}

# bxr runs bundle exec rspec Ruby test cases!
# takes an optional argument for running specific spec files
bxr() {
  clear
  if [[ $# -eq 0 ]]; then
    bundle exec rspec -f documentation
    elif [[ $1 != *.rb ]]; then
    printf "Not a valid spec file: $1\n"
  else
    bundle exec rspec -f documentation ${1:-}
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

# MaKeSPeC. Creates a Ruby file and its companion RSpec file
# in ./lib & ./spec respectively
mkspec() {
  if [[ $# -eq 0 ]]; then
    printf "usage:\n\tmkspec filename1 [filename2 ...]\n"
    elif [[ $1 = "-h" ]]; then
    printf "MaKeSPeC 💎 1.0\n"
    printf "From given argument(s), creates Ruby and RSpec file(s) in ./lib and ./spec\n"
  else
    while [ $# -ne 0 ]
    do
      echo "source \"https://rubygems.org\"\n\ngem 'rspec'" > Gemfile
      mkdir lib spec 2> /dev/null
      touch lib/$1.rb
      echo "require '$1'" > spec/$1_spec.rb
      shift
    done
  fi
}

# View MARKDOWN.md files in the terminal
catmd() {
  if [[ $# -eq 0 ]]; then
    printf "Example usage:\n  catm [filename.md]\n"
  else
    pandoc $1 | lynx -stdin
  fi
}

# Whole system File finder, case insensitive
findf () {
  find / -iname $1 -type f 2>/dev/null
}

# Whole system Directory finder, case insensitive
findd () {
  find / -iname $1 -type d 2>/dev/null
}

# ReactJS Component shell builder
rfc() {
  mkdir $1; cd $1;
  # printf "import React from 'react';\n\nimport './%s.scss';\n\nconst $1 = () => {\n  return <div>$1</div>\n};\n\nexport default $1" $1 > $1.tsx;
  printf "import React from 'react';\n\nimport './%s.scss';\n\nconst $1 = () => {\n  return <div>$1</div>;\n};\n\nexport default $1;" $1 > $1.tsx;
  printf "import React from 'react';\nimport renderer from 'react-test-renderer';\n\nimport %s from './%s';\n\ndescribe('%s', () => {\n  it('should render correctly', () => {\n    const tree = renderer.create(<%s />).toJSON();\n    expect(tree).toMatchSnapshot();\n  });\n});" $1 $1 $1 $1 > $1.test.ts;
  touch $1.scss;
}


# Kill processes using given port
killport() {
  lsof -n -i :$1 |grep LISTEN
  kill -9 $(lsof -i:$1 -t) 2> /dev/null && printf "\e[1;32mPort %d cleared\e[m 🧽\n" $1
}