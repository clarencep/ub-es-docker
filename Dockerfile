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

RUN echo 'root:root' | chpasswd
RUN printf "foobar123\nfoobar123\nn" | vncpasswd

ENV USER root
ENV DISPLAY localhost:10000.0

CMD [ "tightvncserver", ":10000" ]


