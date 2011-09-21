#!/bin/sh
cd
git clone git://github.com/AF83/ucengine.git
cd ucengine
git checkout develop
echo "branch :"
git branch
make rel
cd rel/ucengine

#cat /tmp/code/uce.cfg

cp /tmp/code/uce.cfg etc/uce.cfg
echo "Please enter mongodb's URL (without mongodb://):"
read mongourl
echo "Please enter mongodb's port:"
read mongoport
sed -i 's/mongodbport/'$mongoport'/' etc/uce.cfg
sed -i 's/mongodbhost/'$mongourl'/' etc/uce.cfg
export ERL_LIBS=/home/dotcloud/yaws/lib/yaws/ && bin/ucengine stop && bin/ucengine start
sleep 3
bin/ucengine ping
bin/demo.sh localhost
