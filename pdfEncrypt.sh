qpdf "$1" --encrypt "$2" "$2" 256 -- "$(echo $1 | sed 's/\.pdf$//g' | sed 's/\.pdf$//g')"_encrypt.pdf
