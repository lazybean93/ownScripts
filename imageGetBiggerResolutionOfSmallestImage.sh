IFS=$(echo -en "\n\r"); for i in $(find . -type f | grep -v '\.zip'); do sh "$HOME"/Downloads/ownScripts/imageGetBiggerResolutionValue.sh "$i"; done | sort -h | head -n1
