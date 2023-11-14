# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

DATE=$(echo "$1" | sed 's/_/\n/g' | tail -n1 | sed 's/\./\n/g' | head -n1)
YEAR=${DATE::-4}
MONTH=${DATE:4:2}
DAY=${DATE:6:2}

cp "$1" "$YEAR"".""$MONTH"".""$DAY"" - Ing Diba - ""$1"
