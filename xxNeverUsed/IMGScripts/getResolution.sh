identify -verbose $1 | grep 'Geometry' | awk '{split($0,a," "); print a[2]}' | awk '{split($0,a,"+"); print a[1]}'
