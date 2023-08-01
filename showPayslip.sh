#for i in $(ls | grep '\.pdf\|\.PDF'); do
	while [ ! -z "$(wmctrl -l | grep "Okular")" ]; do
		sleep 1
	done

	FILE="$(readFile.sh $1)"
	COMPANY=""
	if [ ! -z "$(echo $FILE | grep 'http://www.aiim.org/pdfa/ns/id/')" ]; then
		echo $1 Airbus
		COMPANY="Airbus"
	fi
	if [ ! -z "$(echo $FILE | grep '10628532')" ]; then
		echo $1 Thyssenkrupp
		COMPANY="Thyssenkrupp"
	fi
	if [ ! -z "$(echo $FILE | grep 'iText')" ]; then
		echo $1 KuehneNagel
		COMPANY="KuehneNagel"
	fi

	#Open and activate Document
	okular "$1" > /dev/zero 2>&1 & sleep 1;
	sleep 1;
	wmctrl -i -a $(wmctrl -l | grep "Okular" | sed 's/ /\n/' | head -n1)

	#Move Document
	wmctrl -i -r $(wmctrl -l | grep "Okular" | sed 's/ /\n/' | head -n1) -e 0,144,218,1848,2032

	if [ $COMPANY = "Airbus" ] || [ $COMPANY = "KuehneNagel" ]; then
		#Scroll Down
		for count in $(seq 1 100); do
			xte "key Right"
		done
		xte "key Left"
	fi
	if [ $COMPANY = "Thyssenkrupp" ]; then
		#Scroll Up
		for count in $(seq 1 100); do
			xte "key Left"
		done
	fi

	#Wait till window closed
	while [ ! -z "$(wmctrl -l | grep "Okular")" ]; do
		sleep 1
	done
#done
