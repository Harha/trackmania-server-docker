FROM debian:buster

# update & install packages
RUN apt-get update -yq && apt-get install -yq python3 python3-pip mariadb-client build-essential libssl-dev libffi-dev zlib1g-dev liblzma-dev

# create server user
ENV HOME=/home/server
ENV PYPLANET_HOME=/home/server/pyplanet
RUN mkdir -p /home/server && groupadd server && useradd -g server server && mkdir -p $PYPLANET_HOME

# install dedicated server files
WORKDIR $PYPLANET_HOME
COPY run.sh .

# switch to server user
RUN chown -R server:server $HOME
USER server
RUN chmod +x *.sh

# install pyplanet
ENV PATH="${PATH}:/home/server/.local/bin"
RUN pip3 install --user pyplanet
ADD pyplanet $PYPLANET_HOME
RUN mkdir $PYPLANET_HOME/tmp && mkdir $PYPLANET_HOME/logs

# docs: https://pypla.net/en/latest/intro/configuration.html
CMD "./run.sh"
