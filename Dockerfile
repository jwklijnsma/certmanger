FROM debian:bullseye
LABEL maintainer="janwiebe@janwiebe.eu"

RUN export DEBIAN_FRONTEND=noninteractive \
	&& apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		wget \
		screen \
		nano \
		htop \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	;
RUN groupadd -r -g 2001 alex
RUN useradd -r -u 2001 -g 2001 -ms /bin/bash alex
RUN mkdir -p /home/alex 
RUN chown -R alex:alex /home/alex
USER 2001 
WORKDIR /home/alex/
ENTRYPOINT /home/alex/minecraft/startmc.sh
