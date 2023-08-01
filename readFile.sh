FILE="$(xxd -c 256 "$1" | sed 's/  /\n/g' | grep -v '[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9]: ' | sed ':a; N; $!ba; s/\n//g')";
echo $FILE
