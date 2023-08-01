if [ $# -lt 1 ]; then
#	echo Argument 1, the path is missing!
	OWNPATH=$PWD
else
	OWNPATH=$(readlink -f "$1")
fi

# Absolute path to this script. /home/user/bin/foo.sh
#SCRIPT=$(readlink -f $OWNPATH)
# Absolute path this script is in. /home/user/bin
#OWNPATH=`dirname $OWNPATH`



ls -dt "$OWNPATH"/*/ | head -n1
#ls -dt "$OWNPATH"/*/ | head -n1 | sed 's/^/"/g;s/\/$/"/g'
