from alpine

# install awscli
RUN apk --update add curl python && \
    curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip install awscli

RUN mkdir /storage

# backup and sync
COPY backup.sh /backup.sh
RUN chmod +x /backup.sh

CMD /backup.sh
