#!/bin/sh

rootdirectory="$PWD"
dirs="system/core frameworks/native frameworks/base external/selinux bionic/libm"


for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Cleaning $dir patches..."
	git checkout -- . && git clean -df
done

echo "Done!"
cd $rootdirectory
