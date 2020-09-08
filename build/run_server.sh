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
  /bindip="${SERVER_IP}:${SERVER_PORT}" \
  /forceip="${SERVER_IP}:${SERVER_PORT}" \
  /title="${SERVER_TITLE}" \
  /servername="${SERVER_NAME}"
