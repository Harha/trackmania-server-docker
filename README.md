# trackmania-server-docker

Docker image for running a trackmania 2020 dedicated server easily.

I've added PyPlanet to the installation with basic configuration example in the docker-compose section. Later I will probably divide this into 2 images, 1 for server and 1 for pyplanet, to easily control multiple servers with 1 pyplanet container. The PyPlanet documentation says, that the SFTP/SCP/SSH drivers do not work yet for remote-controlling different servers, which is why I haven't done this yet.

## build

The build directory contains the Dockerfile instructions to build a working image to be used as a container.

## compose

The compose directory contains an example compose & config files for actually starting & running a container with the built image.

You're supposed to edit it to your likings if you want to run your own server. Put your maps into the compose/maps folder. Download from trackmania exchange.

### Environment variables

#### SERVER_TITLE

The TitleID for the game the server should be running. By default set to Trackmania 2020. Possible values are:

* Trackmania
* SMStorm
* TMCanyon
* TMStadium
* TMValley
* TMLagoon

#### SERVER_NAME

The visible name for the server.

### PyPlanet configuration

PyPlanet controller can be configured via compose/pyplanet/settings/*.yaml files. For documentation, go to: https://pypla.net/en/latest/intro/configuration.html
