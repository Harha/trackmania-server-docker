#!/bin/bash
set -e

SERVER_IP=`curl https://ipinfo.io/ip`

echo "SERVER_IP: ${SERVER_IP}"
echo "SERVER_PORT: ${SERVER_PORT}"
echo "SERVER_TITLE: ${SERVER_TITLE}"
echo "SERVER_NAME: ${SERVER_NAME}"

./TrackmaniaServer /nodaemon /nologs \
  /dedicated_cfg="cfg_server.xml" \
  /game_settings="MatchSettings/cfg_tracklist.xml" \
  /title="${SERVER_TITLE}" \
  /servername="${SERVER_NAME}"
