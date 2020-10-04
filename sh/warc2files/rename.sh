#!/bin/bash

name=$(ls kabelmaster64.ru/ |grep index.html)
echo "Filename: ${name}"

for i in $(find kabelmaster64.ru/ -name "${name}")
do
	newname=$(echo $i | sed "s!${name}!index.php!")
	echo "Renaming: ${i} ..."
	echo "... to: ${newname}"
	mv ${i} ${newname}
	sed -i "s/xn----7sbbakni4ahmlkbguipjfh7s.xn--p1ai/kabelmaster64.ru/" ${newname}
done
