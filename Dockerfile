FROM ubuntu:16.04
MAINTAINER Zibastian <Discord: @zibastian>

ARG usr=xero
ARG src='https://github.com/xero-official/go-xerom/releases/download/2.0.2/geth-linux.zip'

RUN apt-get update \
	&& apt-get install -y --no-install-recommends psmisc unzip wget ca-certificates \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /tmp/xerom && cd /tmp/xerom && rm -fr * \
	&& wget ${src} \
	&& unzip geth-linux.zip && chmod +x geth && mv geth /usr/bin/ \
	&& wget https://github.com/xero-official/node-deployment-dashboard/raw/master/build/dashboard \
	&& chmod +x dashboard && mv dashboard /usr/bin && rm -fr /tmp/xerom

RUN addgroup --gid 900 ${usr} \
	&& adduser -u 900 --ingroup ${usr} --home /home/${usr} --shell /bin/bash --disabled-password --disabled-login ${usr}

COPY ./docker-entrypoint.sh /usr/bin/docker-entrypoint
RUN chmod +x /usr/bin/docker-entrypoint

COPY ./node-setup.sh /usr/bin/node-setup
RUN chmod +x /usr/bin/node-setup

COPY ./node-info.sh /usr/bin/node-info
RUN chmod +x /usr/bin/node-info

RUN touch /.nodeType \
	&& chown ${usr}:${usr} /.nodeType

CMD ["docker-entrypoint"]

WORKDIR /home/${usr}

USER ${usr}
