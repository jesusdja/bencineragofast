#!/bin/bash

resolutions={16,32,48,64,128}

for file in $PWD/*.jpg; do
	for resolution in {16,32,48,64,128}; do
		convert $file -resize "$resolution"x"$resolution" ${file::(-4)}_"$resolution"x"$resolution".jpg
	done
done
