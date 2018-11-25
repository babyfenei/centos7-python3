# centos7-python3

---

[![](https://images.microbadger.com/badges/image/babyfenei/centos7-python3.svg)](https://microbadger.com/images/babyfenei/centos7-python3 "Get your own image badge on microbadger.com")  [![](https://images.microbadger.com/badges/version/babyfenei/centos7-python3.svg)](https://microbadger.com/images/babyfenei/centos7-python3 "Get your own version badge on microbadger.com")  [![](https://images.microbadger.com/badges/license/babyfenei/centos7-python3.svg)](https://microbadger.com/images/babyfenei/centos7-python3 "Get your own license badge on microbadger.com")

### Shadowsocks-privoxy deployment

**For more information about shadowsocks-privoxy see our [documentation.]https://hub.docker.com/r/bluebu/shadowsocks-privoxy/) **

Example:  

    docker run \
    -d \
    --name shadowsocks-privoxy \
    -p 7070:7070 \
    -p 8118:8118 \
    --env="MARIADB_USER=cactiuser" \
    --env="MARIADB_PASS=my_password" \
    --evn="SERVER_ADDR=ss.server.ip" \
    --evn="SERVER_PORT=port" \
    --evn="PASSWORD=123456" \
    --evn="METHOD=rc4-md5" \
    bluebu/shadowsocks-privoxy

---

### Centos7-python3 Deployment
Now when we have our shadowsocks-privoxy  running we can deploy centos7-python3 image with appropriate environmental variables set.

Example:  

    docker run \
    -d \
    --name cacti \
    --env="PROXY_HTTP=http://shadowsocks-privoxy:8118" \
    --env="PROXY_HTTPS=https://shadowsocks-privoxy:8118 \
    --env="TIMEZONE=Asia/Shanghai" \
    --env="DOWNLOAD_SITE=sitename" \
    --env="DOWNLOAD_PATH=/data" \
    -v '/download_data':'/data/':'rw' \
    babyfenei/centos7-python3

---

### Environmental Variable 
In this Image you can use environmental some variables.

| Variable|Default|Description|
|:------:|:----:|:-----|
| PROXY_HTTP | http://shadowsocks-privoxy:8118 | shadowsocks-privoxy http proxy address |
| PROXY_HTTPS | https://shadowsocks-privoxy:8118 | shadowsocks-privoxy https proxy address |
| TIMEZONE | Asia/Shanghai | linux timezone |
| DOWNLOAD_SITE | sitename| download site name |
| DOWNLOAD_PATH | /data | download path |


