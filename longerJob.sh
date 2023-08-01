echo $1
JOB="$(echo '/usr/bin/nice -n 19 /usr/bin/ionice -c2 -n7' "$1")"
tsp -D $(tsp $JOB) tspSetJobCountToOne.sh;
tsp -S $(($(tsp -S)+1))
