# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

#for i in $(find * -type d | grep -v '[0-9]/'); do
# 	cd $i
# 	for j in $(find * -type f); do
# 		tsp nice -n 19 sh ../mvByCreateDate.sh "$j" > /dev/null &
# 		tsp nice -n 19 sh ../mvByModifyDate.sh "$j" > /dev/null &
# 	done
# 	cd ..
#done

for i in $(find * -type f | grep -v '[0-9]/'); do
	tsp nice -n 19 sh "$SCRIPTPATH"/mvByCreateDate.sh "$i" > /dev/null &
done
