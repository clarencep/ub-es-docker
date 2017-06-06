FROM ubuntu:16.04

COPY . /data

#RUN sh -xe /data/install

RUN echo 'deb http://archive.ubuntu.com/ubuntu/ xenial-security multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://archive.ubuntu.com/ubuntu/ xenial-security multiverse' >> /etc/apt/sources.list
RUN apt-get update 
RUN apt-get install -y m2crypto vim mtr vnstat curl wget
RUN apt-get install -y lxde-core lxterminal tightvncserver xrdp proxychains cpulimit flashplugin-nonfree
RUN apt-get install -y libxss1 fonts-liberation xdg-utils
RUN apt-get install -f
RUN sh -c 'dpkg -i /data/google-chrome*.deb; apt-get install -f; which google-chrome'
RUN apt-get clean
RUN apt-get autoclean
RUN apt-get remove -y
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /tmp/*
RUN rm -rf /data/google-chrome*.deb
RUN chmod +x /data/run-in-docker
RUN ln -s /data/run-in-docker /run-in-docker

EXPOSE 15900

CMD [ "/run-in-docker" ]

