FROM alpine:latest

RUN apk add --no-cache --update squid

# Redirect squid access logs to stdout
RUN ln -sf /dev/stdout /var/log/squid/access.log

# Copy squid configuration
COPY squid/* /etc/squid/

# Set entrypoint and default command arguments
COPY entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["squid","-f","/etc/squid/squid.conf","-NYCd","1"]
