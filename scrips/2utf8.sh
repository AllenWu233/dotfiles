#!/bin/bash
cli="find . -type f \( "

for arg in ${@:1:$#-1}
do
	cli="$cli -iname \*.$arg -o "
done
cli="$cli -iname \*.${@: -1} \)"
#echo $cli
PRE_IFS=$IFS
IFS=$'\n'
for i in `eval $cli`
do
	enca -L zh_CN -x utf-8 $i
done
IFS=$PRE_IFS
echo "ok!"
