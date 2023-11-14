# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

DATE=$(echo "$1" | sed 's/\.pdf//g' | rev)
#echo $DATE
YEAR=$(echo ${DATE:6:4} | rev)
#echo $YEAR
MONTH=$(echo ${DATE:3:2} | rev)
#echo $MONTH
DAY=$(echo ${DATE::2} | rev)
#echo $DAY
cp "$1" "$YEAR"".""$MONTH"".""$DAY"" - Finvesto - ""$1"
