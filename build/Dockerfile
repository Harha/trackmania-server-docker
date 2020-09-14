FROM debian:buster

# update & install packages
RUN apt-get update -yq && apt-get install -yq curl unzip python3 python3-pip mariadb-client build-essential libssl-dev libffi-dev zlib1g-dev liblzma-dev

# create server user
ENV HOME=/home/server
ENV SERVER_HOME=/home/server/tm_server
ENV PYPLANET_HOME=/home/server/pyplanet
RUN mkdir -p /home/server && groupadd server && useradd -g server server && mkdir -p $SERVER_HOME && mkdir -p $PYPLANET_HOME

# install dedicated server files
WORKDIR $HOME
RUN curl -LJO http://files.v04.maniaplanet.com/server/TrackmaniaServer_Latest.zip
RUN unzip TrackmaniaServer_Latest.zip -d tm_server/ && rm TrackmaniaServer_Latest.zip
WORKDIR $SERVER_HOME
COPY run_server.sh .

# switch to server user
RUN chown -R server:server $HOME
USER server
RUN chmod +x ./TrackmaniaServer && chmod +x *.sh

# install pyplanet
ENV PATH="${PATH}:/home/server/.local/bin"
RUN pip3 install --user pyplanet
ADD pyplanet $PYPLANET_HOME
RUN mkdir $PYPLANET_HOME/tmp && mkdir $PYPLANET_HOME/logs

# expose ports
EXPOSE 2350/tcp
EXPOSE 2350/udp
EXPOSE 3450/tcp
EXPOSE 3450/udp
EXPOSE 5005

# docs: https://doc.maniaplanet.com/dedicated-server/references/command-line
CMD "./run_server.sh"
