FROM centos

MAINTAINER Fenei <babyfenei@qq.com>

### 安装依赖
RUN \
    curl -o /etc/yum.repos.d/CentOS-Base.repo -O http://mirrors.aliyun.com/repo/Centos-7.repo && \
    yum install -y epel-release && \
    yum install -y zlib-devel crontabs  cronie  bzip2-devel rsync openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make && \
    yum clean all && \
    rpm --rebuilddb && yum clean all

VOLUME ["/data"]


COPY container-files /

ENV pythonpath=/usr/bin/python \
    TIMEZONE=Asia/Shanghai 

RUN \
tar -xf  /Python-3.6.6.tar.gz && \
cd /Python-3.6.6 && \
./configure prefix=/usr/local/python3 && \
make && make install && \
mv -f $pythonpath ${pythonpath}.bak && \
ln -s /usr/local/python3/bin/python3 $pythonpath && \
rm -f /usr/bin/pip && \
ln -s /usr/local/python3/bin/pip3  /usr/bin/pip && \
#sed -i '1c #!/usr/bin/python2' /usr/bin/yum && \
#sed -i '1c #!/usr/bin/python2' /usr/libexec/urlgrabber-ext-down && \
rm -rf /Python-3.6.6.tar.gz && rm -rf /Python-3.6.6

RUN pip install --upgrade pip


