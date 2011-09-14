#!/bin/sh

slowbuild () {
    cd /tmp
    # Erlang
    wget http://www.erlang.org/download/otp_src_R14B01.tar.gz
    tar zxf otp_src_R14B01.tar.gz 
    cd otp*
    ./configure --prefix=/home/dotcloud/erlang
    make
    make install
    # Yaws
    git clone git://github.com/klacke/yaws.git
    cd yaws
    autoconf
    export PATH=/home/dotcloud/erlang/bin/:$PATH
    ./configure --prefix=/home/dotcloud/yaws
    # apt-get install libpam-dev
    make
    make install
}

fastbuild () {
    curl http://dotcloud-plugins.s3.amazonaws.com/erlang.tar.gz |
    tar -zxf-
    curl http://dotcloud-plugins.s3.amazonaws.com/yaws.tar.gz |
    tar -zxf-
}

cd
fastbuild

cat > ~/profile <<EOF
export PATH=~/erlang/bin:~/yaws/bin:$PATH
export ERL_LIBS=/home/dotcloud/yaws/lib/yaws/
EOF

