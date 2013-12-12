#!/bin/bash

CUR_DIR=`pwd`
LIBDIR="$CUR_DIR/lib"

VSPATH='C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin';
VSPATH_CYGWIN="`cygpath "$VSPATH"`";

TOOL_DUMP="$VSPATH_CYGWIN/dumpbin";
TOOL_LIB="$VSPATH_CYGWIN/lib";

[[ ! -d "$LIBDIR" ]] && mkdir $LIBDIR;

for file in *.dll
do
	# Get the file title without extension (This is double check but a snippet good to preserve)
	title=$file;
	[[ "${file:((${#file}-4))}" = ".dll" ]] && title=${file:0:((${#file}-4))};

	"$TOOL_DUMP" /exports /out:"$title.dmp" $file;
 	
	echo "EXPORTS" > "$title.def";

	# Get export symbols
	body_found=0;
	while read line
	do
		# Ignore empty lines
		[ -z "$line" ] && continue;
	
		#  Find Start 
		[[ ${line:0:17} = "ordinal hint RVA " ]] && body_found=1 && continue;

		# Find End and end loop
		[[ $line = "Summary" ]] && break;

		# Use valid lines
		if [[ $body_found == 1 ]]
		then
			echo ${line##* } >> "$title.def";
		fi;

	done < "$title.dmp";
	rm "$title.dmp";
	
	# Create lib
	$TOOL_LIB /def:"$title.def" /OUT:"$LIBDIR/$title.lib"
	
	rm "$title.def";
done;

