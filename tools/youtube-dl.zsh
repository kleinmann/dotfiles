alias youtube-album='youtube-dl -x -o "%(autonumber)s - %(title)s.%(ext)s" --autonumber-size 2 -f bestaudio --audio-format=opus --xattrs'

alias youtube-audio='youtube-dl -x -f bestaudio --prefer-free-formats -i --xattrs'

alias youtube-video='youtube-dl -f bestvideo\[height\<=?1080\]+bestaudio/best\[height\<=?1080\]/best --prefer-free-formats -i --xattrs'
