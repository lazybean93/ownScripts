COUNT=10
xxd "$1" | head -n $COUNT > 1.xxd
xxd "$2" | head -n $COUNT > 2.xxd
diff 1.xxd 2.xxd
rm 1.xxd 2.xxd
