FROM ubuntu:18.04
MAINTAINER Chris Troutner <chris.troutner@gmail.com>

# Create bitcoin user and group.
RUN groupadd -r bitcoin && useradd -r -m -g bitcoin bitcoin

# Install basic software packages.
RUN set -ex \
	&& apt-get update \
	&& apt-get install -qq --no-install-recommends -y curl wget git gpg sudo \
	software-properties-common gpg-agent

# Install Node and NPM
# (used for debugging)
#RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
#RUN bash nodesource_setup.sh
#RUN apt-get install -y nodejs build-essential

# create data directory
ENV BITCOIN_DATA /data
RUN mkdir "$BITCOIN_DATA"
RUN chown -R bitcoin:bitcoin "$BITCOIN_DATA"
RUN ln -sfn "$BITCOIN_DATA" /home/bitcoin/.bitcoin
COPY lotus.conf /home/bitcoin/lotus.conf
RUN chown -h bitcoin:bitcoin /home/bitcoin/.bitcoin

WORKDIR /home/bitcoin

COPY bitcoin-abc-0.23.1-x86_64-linux-gnu.tar.gz lotus.tar.gz
RUN tar -xvf lotus.tar.gz

# Make persistant config directory
RUN mkdir /home/bitcoin/config

# These values will need to be set at run time.
VOLUME /data
VOLUME /home/bitcoin/config
EXPOSE 11604 11605

# Startup script that will copy in config settings at startup.
COPY startup-script.sh startup-script.sh
COPY run-script.sh run-script.sh
CMD ["./startup-script.sh"]

#COPY dummyapp.js dummyapp.js
#CMD ["node", "dummyapp.js"]
