echo $(($RANDOM*$(($(date +%N | sed 's/0//g') % 10000))))
