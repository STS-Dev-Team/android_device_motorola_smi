#!/bin/sh

BASE=/home/hiemanshu/cm/vendor/motorola/smi/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-files.txt`; do
DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
mkdir -p $BASE/$DIR
    fi
cp /home/hiemanshu/razri/system/$FILE $BASE/$FILE
done

./setup-makefiles.sh


