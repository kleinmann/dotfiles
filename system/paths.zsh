# original $PATH
# PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# standard order
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# add $HOME/bin
export PATH=$HOME/bin:$PATH

# add java bin
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_11.jdk/Contents/Home
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# add python bin
export PATH=/Library/Frameworks/Python.framework/Versions/2.6/bin:$PATH
export PATH=/usr/local/share/python:$PATH

# haskell
export PATH=$HOME/.cabal/bin:$PATH

# various
export PATH=/Applications/Network:/opt/local/bin:/opt/local/sbin:/usr/texbin:$PATH

# npm
export PATH=$HOME/node_modules/.bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# php
export PATH=$(brew --prefix josegonzalez/php/php54)/bin:$PATH

# go
export GOROOT=$(brew --prefix go)
export GOPATH=$HOME/code/go
export PATH=$GOPATH/bin:$PATH

# original $MANPATH
# usr/share/man:/usr/local/share/man:/usr/X11/man

export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:/usr/X11/man


export ECLIPSE_HOME='/Applications/eclipse'
