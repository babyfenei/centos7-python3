#!/bin/sh
echo "$(date +%F_%R) [Note] Setting server timezone settings to '${TIMEZONE}'"
rm -rf /etc/localtime
ln -s  /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
echo "56 21 * * * root /pydown.sh >> /var/log/down.log" > /etc/cron.d/down
sed -i "s#PROXY_HTTPS#${PROXY_HTTPS}#g" /pydownload/proxies.json
sed -i "s#PROXY_HTTP#${PROXY_HTTP}#g" /pydownload/proxies.json
sed -i "s#DOWNLOAD_SITE#${DOWNLOAD_SITE}#g" /pydown.sh
sed -i "s#DOWNLOAD_PATH#${DOWNLOAD_PATH}#g" /pydownload/download.py
chmod +x /pydown.sh
mkdir -p ${DOWNLOAD_PATH}
# start cron service
echo "$(date +%F_%R) [Note] Starting crond service."
/usr/sbin/crond -n &
touch /var/log/down.log
tail -f /var/log/down.log
