U.C. Engine On DotCloud (ALPHA)
===============================

This is an **ALPHA** (i.e., not production-ready) Erlang + Yaws stack for DotCloud,

An helper then deploys the **develop** branch of U.C. Engine (http://ucengine.org) with MongoDB.
Nginx reverse proxy for UCEngine is also provided.


How It Works
------------

Since the Erlang build is very long, it downloads a pre-built Erlang from S3.
The build is not totally DotCloud-compliant (it uses all the default build
options, instead of trying to setup the logs/data/etc. directories in the
proper place).

Again: **don't use this for production!**

Proper Erlang support will come soon.


How To Use It
-------------

You have three steps to do::

  git clone git://github.com/jpetazzo/ucengine-on-dotcloud-ALPHA.git
  dotcloud push ucengine ucengine-on-dotcloud-ALPHA
  dotcloud info ucengine.db
  
Note the URL assigned to the app at this stage; 
Note MongoDB host and port;

then move to the next step::

  dotcloud run ucengine.erlang /tmp/code/ucengine.sh

This last step will ask you to enter the host and port assigned to mongodb.

You can then go to the app (add /api/ to reach Nginx proxy access) URL to see U.C. Engine in action!

