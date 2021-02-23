FROM debian:buster

# update & install packages
RUN apt-get update -yq && apt-get install -yq curl unzip

# create server user
ENV HOME=/home/server
ENV SERVER_HOME=/home/server/tm_server
RUN mkdir -p /home/server && groupadd server && useradd -g server server && mkdir -p $SERVER_HOME

# install dedicated server files
WORKDIR $HOME
RUN curl -LJO http://files.v04.maniaplanet.com/server/TrackmaniaServer_Latest.zip && \
    unzip TrackmaniaServer_Latest.zip -d tm_server/ && rm TrackmaniaServer_Latest.zip
WORKDIR $SERVER_HOME
COPY run.sh .

# switch to server user
RUN chown -R server:server $HOME
USER server
RUN chmod +x ./TrackmaniaServer && chmod +x *.sh

# expose ports
EXPOSE 2350/tcp
EXPOSE 2350/udp
EXPOSE 3450/tcp
EXPOSE 3450/udp
EXPOSE 5005

# docs: https://doc.maniaplanet.com/dedicated-server/references/command-line
CMD "./run.sh"
