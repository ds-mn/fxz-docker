FROM buildpack-deps:stable-scm

RUN set -ex ;\
    apt-get update ;\
    apt-get install -y automake autopoint libtool make ;\
    git clone https://github.com/conor42/fxz ;\
    cd /fxz ;\
    ./autogen.sh ;\
    ./configure ;\
    make -j4 ;\
    make install ;\
    ldconfig ;\
    make installcheck ;\
    cd / ;\
    rm -rf /fxz ;\
    apt-get autoremove --purge -y automake autopoint libtool make ;\
    rm -rf /var/lib/apt/lists/* ;\
    fxz -h
    

