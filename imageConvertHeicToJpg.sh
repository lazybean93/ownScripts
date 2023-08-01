# Absolute path to this script. /home/user/bin/foo.sh
#SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
#SCRIPTPATH=`dirname $SCRIPT`

for i in $(ls | grep heic); do
	heif-convert -q 99 "$i" "$(echo $i | sed 's/heic/jpg/g')";
done
