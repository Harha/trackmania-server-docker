FROM debian:buster

# update & install packages
RUN apt-get update -yq && apt-get install -yq curl unzip

# create server user
ENV HOME=/home/server
ENV SERVER_HOME=/home/server/tm_server
RUN mkdir -p /home/server
RUN groupadd server && useradd -g server server
RUN mkdir -p $SERVER_HOME

# install dedicated server files
WORKDIR $HOME
RUN curl -LJO http://files.v04.maniaplanet.com/server/TrackmaniaServer_Latest.zip
RUN unzip TrackmaniaServer_Latest.zip -d tm_server/
RUN rm TrackmaniaServer_Latest.zip

# switch to server user
WORKDIR $SERVER_HOME
RUN chown -R server:server $SERVER_HOME
USER server
RUN chmod +x ./TrackmaniaServer

CMD ./TrackmaniaServer /title=$SERVER_TITLE /game_settings=MatchSettings/tracklist.txt /dedicated_cfg=dedicated_cfg.txt
