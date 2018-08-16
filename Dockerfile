FROM  centos

RUN adduser -u 18345 cmp \
    && yum install -y ntp \
    && ln -sf /dev/stdout /var/log/ntp.log \
    && yum clean all \
    && rm -rf /var/cache/yum/ /opt/tmp \

USER cmp
WORKDIR /home/cmp

CMD ["ntpd", "-u", "cmp:cmp", "-gn", "-l", "/var/log/ntp.log"]
