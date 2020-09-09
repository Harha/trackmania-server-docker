#!/bin/bash
set -e

echo "HOME: ${HOME}"
echo "SERVER_HOME: ${SERVER_HOME}"
echo "PYPLANET_HOME: ${PYPLANET_HOME}"
echo "SERVER_TITLE: ${SERVER_TITLE}"
echo "SERVER_NAME: ${SERVER_NAME}"

# start pyplanet
python3 $PYPLANET_HOME/manage.py --detach --pid-file=pyplanet.pid

# start server
./TrackmaniaServer /nodaemon /nologs \
  /dedicated_cfg="cfg_server.xml" \
  /game_settings="MatchSettings/cfg_tracklist.xml" \
  /title="${SERVER_TITLE}" \
  /servername="${SERVER_NAME}"

# stop pyplanet
kill -SIGTERM `cat pyplanet.pid`
