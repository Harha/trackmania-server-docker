#!/bin/bash

echo "HOME: ${HOME}"
echo "PYPLANET_HOME: ${PYPLANET_HOME}"

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
run_pyplanet &
wait
