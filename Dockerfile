FROM clarencep/ub-es:x

COPY . /data

RUN apt-get update \
    && sh -c 'dpkg -i /data/google-chrome*.deb; apt-get install -f -y; which google-chrome' \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get remove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /data/google-chrome*.deb 

RUN chmod +x /data/run-in-docker && ln -s /data/run-in-docker /run-in-docker

EXPOSE 15900

CMD [ "/run-in-docker" ]

