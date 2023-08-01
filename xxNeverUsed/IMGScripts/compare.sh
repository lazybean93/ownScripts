for i in $(find * | grep Ordnung/$1/ | grep 'JPG\|jpg'); do
	for j in $(find * | grep Ordnung/$2/ | grep 'JPG\|jpg'); do
		echo $i $j;
		compare -metric RMSE $i $j tmp.png;
		echo " ";
	done;
done
