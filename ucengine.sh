#!/bin/sh
cd
git clone git://github.com/AF83/ucengine.git
cd ucengine
make rel
cd rel/ucengine
echo "Please enter the virtual host of this service (without http://):"
read vhost
sed -i 's/{port, 5280}/{port, 8080}/' etc/uce.cfg
sed -i 's/{"localhost",/{"'$vhost'",/' etc/uce.cfg
bin/ucengine start
sleep 3
bin/ucengine ping
bin/demo.sh $vhost
