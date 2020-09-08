#!/bin/bash
set -e

echo "MASTERSERVER_LOGIN: ${MASTERSERVER_LOGIN}"
echo "SERVER_IP: ${SERVER_IP}"
echo "SERVER_TITLE: ${SERVER_TITLE}"
echo "SERVER_NAME: ${SERVER_NAME}"

./TrackmaniaServer /nodaemon /nologs \
  /dedicated_cfg="cfg_server.xml" \
  /game_settings="MatchSettings/cfg_tracklist.xml" \
  /bindip="${SERVER_IP}:${SERVER_PORT}" \
  /title="${SERVER_TITLE}" \
  /servername="${SERVER_NAME}"
