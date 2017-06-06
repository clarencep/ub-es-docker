FROM ubuntu:16.04

RUN echo 'deb http://archive.ubuntu.com/ubuntu/ xenial-security multiverse' >> /etc/apt/sources.list \
    && echo 'deb-src http://archive.ubuntu.com/ubuntu/ xenial-security multiverse' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y m2crypto vim mtr vnstat curl wget \
    && apt-get install -y lxde-core lxterminal tightvncserver xrdp proxychains cpulimit flashplugin-nonfree \
    && apt-get install -y libxss1 fonts-liberation xdg-utils \
    && apt-get install -f -y \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get remove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* 


RUN DEBIAN_FRONTEND="noninteractive" echo 'root:root' | chpasswd
RUN DEBIAN_FRONTEND="noninteractive" printf "foobar21\nfoobar21\nn\n\n" | vncpasswd

ENV USER root
ENV DISPLAY localhost:10000.0

CMD [ "sh", "-c", "tightvncserver :10000; exec bash -i" ]


