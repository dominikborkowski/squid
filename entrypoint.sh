#!/bin/sh
set -e

# Grant permissions to /dev/stdout for spawned squid process
chown squid:squid /dev/stdout
mkdir /var/spool/squid
chown squid:squid /var/spool/squid

echo ""
echo "[DEBUG] squid.conf"
cat /etc/squid/squid.conf

echo ""
echo "[DEBUG] whitelist.txt"
cat /etc/squid/whitelist.txt

echo ""
echo "[DEBUG] blacklist.txt"
cat /etc/squid/blacklist.txt
# Run application
exec "$@"
