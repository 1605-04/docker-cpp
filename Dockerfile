FROM ubuntu
COPY sources.list /etc/apt/sources.list

# common tools
RUN apt-get update && apt-get -y upgrade  && apt-get -y install libdpkg-perl bzip2 libalgorithm-merge-perl libc6 dpkg-dev libc6 libc-dev-bin libc-dev build-essential

# 配置中文语言
ENV LANGUAGE zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
ENV LC_ALL=zh_CN.UTF-8
RUN /usr/share/locales/install-language-pack zh_CN \
	&& locale-gen zh_CN.UTF-8 \
	&& dpkg-reconfigure --frontend noninteractive locales \
	&& apt-get -qqy --no-install-recommends install language-pack-zh-hans
# 设置时区
ENV TZ "PRC"
RUN echo "Asia/Shanghai" | tee /etc/timezone \
	&& dpkg-reconfigure --frontend noninteractive tzdata
