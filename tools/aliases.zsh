# View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
# Machines on local network
alias nwho='ping -b -c 2 255.255.255.255 2>&1 | grep "bytes from" | cut -d " " -f 4 | sort | uniq | sed -e "s/://g"'

# use atool to extract stuff if present
if type atool > /dev/null 2>&1 ; then
  alias xx="atool -x"
else
  alias xx="smartextract"
fi
