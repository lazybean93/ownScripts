IFS=$(echo -en "\n\r"); for i in $(find . -type f | grep -v '\.zip'); do sh "$HOME"/Downloads/OwnScripts/IMGScripts/getBiggerResolutionValue.sh "$i"; done | sort -h | head -n1
