Number=100;
mkdir temp
for i in $(find . -type f | sed 's/\.\///g' | sed 's/\.jpg//g' | sed 's/\.JPG//g' | sort); do
	Number=$(($Number+1));
	cp "$i"\.* temp/$(printf "%03d" $Number).jpg;
done
