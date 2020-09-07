# trackmania-server-docker

Docker image for running a trackmania 2020 dedicated server easily.

## build

The build directory contains the Dockerfile instructions to build a working image to be used as a container.

## compose

The compose directory contains an example compose & config files for actually starting & running a container with the built image.

You're supposed to edit it to your likings if you want to run your own server. Put your maps into the compose/maps folder. Download from trackmania exchange.

### Environment variables

#### MASTERSERVER_LOGIN

Your players.trackmania.com dedicated server login.

#### MASTERSERVER_PASSWORD

Your players.trackmania.com dedicated server password.

#### SERVER_IP

IP the server will bind to.

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
