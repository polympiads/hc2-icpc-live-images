
# HC2 - ICPC Tools

This repository contains the docker images used by Polympiads for the Helvetic Coding Contest.
These docker images are wrappers for the ICPC tools created and developped by the ICPC Live team,
and follows therefore the same licenses as the [live-v3](https://github.com/icpc/live-v3) and
[balloons](https://github.com/icpc/balloons) repositories.

## Intranet

The intranet of the docker image is the following :
 - The Clics API that connects to the target contest (for us, Codeforces) (port 25301, should not be accessible from internet.)
 - The Live Interface that connects to the local clics API. (port 25302, should be accessible from internet)
 - The Balloons Interface that connects to the local clics API. (port 25303, should be accessible from internet)

## polympiads/hc2/live-v3 / live-v3

This docker image compiles the artifacts from the [live-v3](https://github.com/icpc/live-v3) into a base docker image, it is provided as a base for other images using cds converter or live interface.

## polympiads/hc2/clics-api / clics-api

This docker image uses the `live-v3` image and the cds converter JAR file to start a server with the parameters. The entrypoint of the docker image takes the command and uses it as the arguments for the jar file. In the docket compose, the configuration volume is mounted and used to find the codeforces target and make an API out of it.

## polympiads/hc2/stream-admin / stream-admin

This docker image uses the `live-v3` image and in particular the `live-v3-dev.jar`.

## polympiads/hc2/balloons / balloons

This docker image uses the `live-v3` image and compiles the [balloons](https://github.com/icpc/balloons) code from ICPC live.

# Configuration

There are two configuration files in the `config` folder, `use-clics` and `cf-config`.
The `cf-config` is the one used by the CDS Converter (for HC2 2025, it is a Codeforces
contest). You may want to modify the `settings.json` file to change the contest or the
provider. The `use-clics` folder contains the settings for both balloons and stream admin,
I don't recommend modifying the `settings.json`. When you run the docker compose for the first time,
the following file should appear :
 - `users.json`, contains the user for the stream admin.
 - `media` and `preset` folders for advanced configuration of the stream admin.

To setup a volunteer for the balloons interface, you can exec inside the balloons container created by docker compose and run the `java -jar build/libs/balloons-<version>.jar -c /config/use-clics <options>` command with the appropriate arguments depending on the volunteer type.
