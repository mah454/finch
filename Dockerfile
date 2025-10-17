FROM registry.docker.ir/openresty/openresty 

WORKDIR /tmp

RUN apt update ; apt install wget unzip make -y
RUN wget https://luarocks.org/releases/luarocks-3.12.2.tar.gz ; \
    tar zxpf luarocks-3.12.2.tar.gz ; cd luarocks-3.12.2 ; \
    ./configure && make && make install
RUN luarocks install finch
RUN apt autoremove ; apt clean ; rm -rf /var/lib/apt/lists/* ; rm -rf /tmp/*
