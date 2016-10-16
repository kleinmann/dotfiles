alias youtube-album='youtube-dl -x -o "%(autonumber)s - %(title)s.%(ext)s" --autonumber-size 2 -f bestaudio --audio-format=opus --xattrs --external-downloader aria2c --external-downloader-args "-c -j 3 -x 3 -s 3 -k 1M"'

alias youtube-audio='youtube-dl -x -f bestaudio --prefer-free-formats -i --xattrs --external-downloader aria2c --external-downloader-args "-c -j 3 -x 3 -s 3 -k 1M"'

alias youtube-video='youtube-dl -f bestvideo+bestaudio --prefer-free-formats -i --xattrs --external-downloader aria2c --external-downloader-args "-c -j 3 -x 3 -s 3 -k 1M"'
