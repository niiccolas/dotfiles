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

webskel() {
  # HTML boilerplate
  echo '<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <!-- CSS stylesheets -->
  <link rel="stylesheet" href="./assets/css/reset.css">
  <link rel="stylesheet" href="./assets/css/main.css">

  <!-- JS files -->
  <script src="./assets/js/main.js"></script>

  <title>Document</title>
</head>
<body>

</body>
</html>' > index.html

  # Create file structure
  mkdir assets; mkdir assets/{css,js,img}

  # CSS reset
  echo '/*! normalize.css v8.0.1 | MIT License | github.com/necolas/normalize.css */

/* Document
   ========================================================================== */

/**
 * 1. Correct the line height in all browsers.
 * 2. Prevent adjustments of font size after orientation changes in iOS.
 */

html {
  line-height: 1.15; /* 1 */
  -webkit-text-size-adjust: 100%; /* 2 */
}

/* Sections
   ========================================================================== */

/**
 * Remove the margin in all browsers.
 */

body {
  margin: 0;
}

/**
 * Render the `main` element consistently in IE.
 */

main {
  display: block;
}

/**
 * Correct the font size and margin on `h1` elements within `section` and
 * `article` contexts in Chrome, Firefox, and Safari.
 */

h1 {
  font-size: 2em;
  margin: 0.67em 0;
}

/* Grouping content
   ========================================================================== */

/**
 * 1. Add the correct box sizing in Firefox.
 * 2. Show the overflow in Edge and IE.
 */

hr {
  box-sizing: content-box; /* 1 */
  height: 0; /* 1 */
  overflow: visible; /* 2 */
}

/**
 * 1. Correct the inheritance and scaling of font size in all browsers.
 * 2. Correct the odd `em` font sizing in all browsers.
 */

pre {
  font-family: monospace, monospace; /* 1 */
  font-size: 1em; /* 2 */
}

/* Text-level semantics
   ========================================================================== */

/**
 * Remove the gray background on active links in IE 10.
 */

a {
  background-color: transparent;
}

/**
 * 1. Remove the bottom border in Chrome 57-
 * 2. Add the correct text decoration in Chrome, Edge, IE, Opera, and Safari.
 */

abbr[title] {
  border-bottom: none; /* 1 */
  text-decoration: underline; /* 2 */
  text-decoration: underline dotted; /* 2 */
}

/**
 * Add the correct font weight in Chrome, Edge, and Safari.
 */

b,
strong {
  font-weight: bolder;
}

/**
 * 1. Correct the inheritance and scaling of font size in all browsers.
 * 2. Correct the odd `em` font sizing in all browsers.
 */

code,
kbd,
samp {
  font-family: monospace, monospace; /* 1 */
  font-size: 1em; /* 2 */
}

/**
 * Add the correct font size in all browsers.
 */

small {
  font-size: 80%;
}

/**
 * Prevent `sub` and `sup` elements from affecting the line height in
 * all browsers.
 */

sub,
sup {
  font-size: 75%;
  line-height: 0;
  position: relative;
  vertical-align: baseline;
}

sub {
  bottom: -0.25em;
}

sup {
  top: -0.5em;
}

/* Embedded content
   ========================================================================== */

/**
 * Remove the border on images inside links in IE 10.
 */

img {
  border-style: none;
}

/* Forms
   ========================================================================== */

/**
 * 1. Change the font styles in all browsers.
 * 2. Remove the margin in Firefox and Safari.
 */

button,
input,
optgroup,
select,
textarea {
  font-family: inherit; /* 1 */
  font-size: 100%; /* 1 */
  line-height: 1.15; /* 1 */
  margin: 0; /* 2 */
}

/**
 * Show the overflow in IE.
 * 1. Show the overflow in Edge.
 */

button,
input { /* 1 */
  overflow: visible;
}

/**
 * Remove the inheritance of text transform in Edge, Firefox, and IE.
 * 1. Remove the inheritance of text transform in Firefox.
 */

button,
select { /* 1 */
  text-transform: none;
}

/**
 * Correct the inability to style clickable types in iOS and Safari.
 */

button,
[type="button"],
[type="reset"],
[type="submit"] {
  -webkit-appearance: button;
}

/**
 * Remove the inner border and padding in Firefox.
 */

button::-moz-focus-inner,
[type="button"]::-moz-focus-inner,
[type="reset"]::-moz-focus-inner,
[type="submit"]::-moz-focus-inner {
  border-style: none;
  padding: 0;
}

/**
 * Restore the focus styles unset by the previous rule.
 */

button:-moz-focusring,
[type="button"]:-moz-focusring,
[type="reset"]:-moz-focusring,
[type="submit"]:-moz-focusring {
  outline: 1px dotted ButtonText;
}

/**
 * Correct the padding in Firefox.
 */

fieldset {
  padding: 0.35em 0.75em 0.625em;
}

/**
 * 1. Correct the text wrapping in Edge and IE.
 * 2. Correct the color inheritance from `fieldset` elements in IE.
 * 3. Remove the padding so developers are not caught out when they zero out
 *    `fieldset` elements in all browsers.
 */

legend {
  box-sizing: border-box; /* 1 */
  color: inherit; /* 2 */
  display: table; /* 1 */
  max-width: 100%; /* 1 */
  padding: 0; /* 3 */
  white-space: normal; /* 1 */
}

/**
 * Add the correct vertical alignment in Chrome, Firefox, and Opera.
 */

progress {
  vertical-align: baseline;
}

/**
 * Remove the default vertical scrollbar in IE 10+.
 */

textarea {
  overflow: auto;
}

/**
 * 1. Add the correct box sizing in IE 10.
 * 2. Remove the padding in IE 10.
 */

[type="checkbox"],
[type="radio"] {
  box-sizing: border-box; /* 1 */
  padding: 0; /* 2 */
}

/**
 * Correct the cursor style of increment and decrement buttons in Chrome.
 */

[type="number"]::-webkit-inner-spin-button,
[type="number"]::-webkit-outer-spin-button {
  height: auto;
}

/**
 * 1. Correct the odd appearance in Chrome and Safari.
 * 2. Correct the outline style in Safari.
 */

[type="search"] {
  -webkit-appearance: textfield; /* 1 */
  outline-offset: -2px; /* 2 */
}

/**
 * Remove the inner padding in Chrome and Safari on macOS.
 */

[type="search"]::-webkit-search-decoration {
  -webkit-appearance: none;
}

/**
 * 1. Correct the inability to style clickable types in iOS and Safari.
 * 2. Change font properties to `inherit` in Safari.
 */

::-webkit-file-upload-button {
  -webkit-appearance: button; /* 1 */
  font: inherit; /* 2 */
}

/* Interactive
   ========================================================================== */

/*
 * Add the correct display in Edge, IE 10+, and Firefox.
 */

details {
  display: block;
}

/*
 * Add the correct display in all browsers.
 */

summary {
  display: list-item;
}

/* Misc
   ========================================================================== */

/**
 * Add the correct display in IE 10+.
 */

template {
  display: none;
}

/**
 * Add the correct display in IE 10.
 */

[hidden] {
  display: none;
}' > ./assets/css/reset.css

# CSS main
touch ./assets/css/main.css
echo '/* apply a natural box layout model to all elements, but allowing components to change */
html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

body {
  font-family: Avenir, Helvetica, sans-serif;
}' > ./assets/css/main.css

# JS main
touch ./assets/js/main.js
}