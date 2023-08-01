if [ $(tsp | grep queued | grep 'tspSetJobCountToOne.sh' | wc -l) -gt 0 ]; then
	tsp -S $(tsp | grep queued | grep 'tspSetJobCountToOne.sh' | wc -l)
else
	tsp -S 1
fi
