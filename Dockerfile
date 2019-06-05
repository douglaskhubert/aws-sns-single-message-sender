FROM alpine:3.7
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.16.26 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

COPY build/setup.sh /usr/local/bin/setup.sh
COPY message /message
RUN chmod +x /usr/local/bin/setup.sh

#ENTRYPOINT sh
ENTRYPOINT [ "/bin/sh", "-c", "setup.sh && aws sns publish --topic-arn ${AWS_TOPIC_ARN} --message file://message" ]
