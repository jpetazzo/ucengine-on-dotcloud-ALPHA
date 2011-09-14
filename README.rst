U.C. Engine On DotCloud (ALPHA)
===============================

This is an **ALPHA** (i.e., not production-ready) Erlang stack for DotCloud,
with an helper to deploy a basic U.C. Engine demo app on top of it.


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
  
Note the URL assigned to the app at this stage; then move to the next step::

  dotcloud run ucengine.erlang /tmp/code/ucengine.sh

This last step will ask you to enter the virtual host assigned to your app.
This is the URL assigned to the app, without the ``http://`` and the final
``/``.

You can then go to the URL to see U.C. Engine in action!

