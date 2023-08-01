inquire ()  {
  echo  -n "$1 [y/n]? "
  read answer
  finish="-1"
  while [ "$finish" = '-1' ]
  do
    finish="1"
    if [ "$answer" = '' ];
    then
      answer=""
    else
      case $answer in
        y | Y | yes | YES ) answer=true;;
        n | N | no | NO ) answer=false;;
        *) finish="-1";
           echo -n 'Invalid response -- please reenter:';
           read answer;;
       esac
    fi
  done
}

notfinish=true;
while $notfinish; do
	inquire "Black/White?"
	if $answer; then
		for i in $(ls [0-9][0-9][0-9].png | grep -v modified) ; do convert $i -threshold 75% modified_$i; done
		pdfjam --a4paper --fitpaper false --rotateoversize false modified*.png --outfile Scan.pdf;
	else
		for i in $(ls [0-9][0-9][0-9].png | grep -v modified) ; do convert $i -quality 20% modified_$i.jpg; done
		#pdfjam --a4paper --fitpaper false --rotateoversize false modified_[0-9][0-9][0-9].png.jpg --outfile Scan.pdf;
		pdfjam modified_[0-9][0-9][0-9].png.jpg --outfile Scan.pdf;
	fi
	okular Scan.pdf;
	inquire "Is result Great?";
	if $answer; then
		echo "Please move Scan.pdf to final destination!";
		rm *.png *.jpg 2>/dev/null >/dev/null;
		notfinish=false;
	fi
done
