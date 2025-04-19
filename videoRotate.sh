for i in $(ls | grep mp4); do tsp ffmpeg -i "$i" -vf "transpose=2,transpose=2" -c:a copy "$i""_rot.mp4"; done
