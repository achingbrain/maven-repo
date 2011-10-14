#!/bin/bash
# Borrowed *ahem* from http://chkal.blogspot.com/2010/09/maven-repositories-on-github.html
# This script creates a directory index for every subdirectory in this repository,
# ignoring hidden files and the root directory

for DIR in $(find . \( ! -regex '.*/\..*' \)  -type d); do (
	echo -e "<html>\n<body>\n<h1>Directory listing</h1>\n<hr/>\n<pre>"
	
	# only provide a ../ link if we are not in the root directory
	if [ $DIR != "." ];
	then
		echo -e "<a href=\"../\">../</a>"
	fi
	
	ls -1p "${DIR}" | grep -v "^\./$" | grep -v "^index\.html$" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }'
	echo -e "</pre>\n</body>\n</html>"
) > "${DIR}/index.html"
done
