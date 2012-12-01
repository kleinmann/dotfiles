# original $PATH
# PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# standard order
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# add $HOME/bin
export PATH=$HOME/bin:$PATH

# add java bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_09.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

# add python bin
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/2.6/bin
export PATH=$PATH:/usr/local/share/python

# haskell
export PATH=$PATH:$HOME/.cabal/bin

# various
export PATH=$PATH:/Applications/Network:/opt/local/bin:/opt/local/sbin:/usr/texbin

# npm
export PATH=$PATH:$HOME/node_modules/.bin
export PATH=$PATH:/usr/local/share/npm/bin

# original $MANPATH
# usr/share/man:/usr/local/share/man:/usr/X11/man

export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:/usr/X11/man


export ECLIPSE_HOME='/Applications/eclipse'
