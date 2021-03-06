# original $PATH
# PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# standard order
# PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
#
export PATH=/usr/local/sbin:/usr/local/bin:$PATH

# add $HOME/bin
export PATH=$HOME/bin:$PATH

# add java bin
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_11.jdk/Contents/Home
#export
#JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# haskell
export PATH=$HOME/.cabal/bin:$PATH

# various
export PATH=/Applications/Network:/opt/local/bin:/opt/local/sbin:/usr/texbin:/Library/TeX/texbin:$PATH

# npm
export PATH=$HOME/node_modules/.bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/opt/node@10/bin:$PATH

# php
[[ -d /Applications/MAMP ]] && export PATH=/Applications/MAMP/bin/php/php7.3.9/bin:$PATH
export PATH="$HOME/.symfony/bin:$PATH"

# go
export GOPATH=$HOME/code/go
export PATH=$GOPATH/bin:$PATH
export PATH=/usr/local/opt/go/bin:$PATH

# original $MANPATH
# usr/share/man:/usr/local/share/man:/usr/X11/man

export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:/usr/X11/man

# [[ -x `which brew` ]] && export ANDROID_HOME=$(brew --prefix android-sdk)

export ECLIPSE_HOME='/Applications/eclipse'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
