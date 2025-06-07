find . -type f -printf '%s %p\n' | sort -nr | grep -v '\.iso$\|\.mp4$\|\.mkv$\|\.zip$\|\.vdi$\|\.ova$\|\.exe$\|\.vmdk$\|\.MP4$\|\.img$\|\.MTS$\|\.sav$\|\.7z$\|\.tar$\|\.deb$\|\.gz$\|\.rar$\|/.secret/\|\.pptx$\|\.mp3$\|\.webm$\|\.xz$\|\.xcf$\|\.pdf$\|\.db$\|\.png$\|\.jar$\|\.MOV$\|\.mov$\|\.csv$\|\.tz$\|\.pack$\|\.journal$\|\.dat$\|\.xml$\|\.tgz$\|\.jpg$\|\.sqlite$\|\.txt$\|\.odt$\|\.log$\|\.wav$\|\.VHD$\|\.mpg$\|\.avi$\|\.WAV$\|\.wmv$\|\.wma$' | head -n 20

#find . -type f -name *.dll | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#find . -type f -name *.reg | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#find . -type f -name *.so | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#find . -type f -name *.class | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#find . -type f -name *.vdm | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#find . -type f -name *.ps | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#find . -type f -name *.tif | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#find . -type f -name *.eps | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#find . -type f -name *.azw | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#find . -type f -name *.swf | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#find . -type f -name *.pyc | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#find . -type f -name *.dd | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#find . -type f -name *.ico | sed 's/^/rm "/g;s/$/"/g;s/^rm ""$//g' >> deleteMe.sh
#echo "rm deleteMe.sh" >> deleteMe.sh
