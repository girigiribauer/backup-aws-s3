from alpine

# install awscli
RUN apk --update add curl python && \
    curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip install awscli

ENTRYPOINT ["/usr/bin/aws"]
