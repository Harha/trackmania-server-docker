#!/bin/bash

echo "HOME: ${HOME}"
echo "SERVER_HOME: ${SERVER_HOME}"
echo "PYPLANET_HOME: ${PYPLANET_HOME}"
echo "SERVER_TITLE: ${SERVER_TITLE}"
echo "SERVER_NAME: ${SERVER_NAME}"

# func: keep tmserver running
run_tmserver() {
  cd $SERVER_HOME
  while :
  do
    echo "TrackManiaServer starting..."
    ./TrackmaniaServer /nodaemon /nologs \
      /dedicated_cfg="cfg_server.xml" \
      /game_settings="MatchSettings/cfg_tracklist.xml" \
      /title="${SERVER_TITLE}" \
      /servername="${SERVER_NAME}"
    echo "TrackManiaServer exited, restarting in 15 seconds..."
    sleep 15
  done
}

# func: keep pyplanet running
run_pyplanet() {
  cd $PYPLANET_HOME
  while :
  do
    echo "PyPlanet starting..."
    python3 manage.py start
    echo "PyPlanet exited, restarting in 15 seconds..."
    sleep 15
  done
}

# run services
run_tmserver &
run_pyplanet &
wait
