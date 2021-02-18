# rvbg/garrymod-ttt

This is a Docker based GarrysMod TTT server.

## Run the server
```
docker run --name ttt -v ttt-data:/app -v ttt-config:/cfg -v ttt-content:/content -p 27015:27015/udp -d -t rvbg/garrymod-ttt:latest
```

<br>
List of enviromental variables you should add:

| ENV | Description | Default value |
| --- | --- | --- |
| NAME | Name of the server. | DockerServer |
| STARTMAP | Map on which the server will start the first round. | gm_construct |
| WORKSHOP | Steam workshop collection id. Example: 1644491708 for https://steamcommunity.com/sharedfiles/filedetails/?id=1644491708. | 0 |

<br>
List of enviromental variables you can also add:

| ENV | Description | Default value |
| --- | --- | --- |
| PORT | Change the port of the server. Changing docker port is required. | 27015 |
| MAXPLAYERS | Amount of players that can join the server. | 16 |
| PASSWORD | Password which is needed to join the server. | |
| MAIL | Your mail adress. | no@mail.addit |
| RCONPW | Password to connect to rcon. Is set random and printed in docker log when not defined. | RANDOM |
| FPT | First preptime (in seconds). | 60 |
| PT | Preptime (in seconds). | 15 |
| DT | Posttime (in seconds). | 15 |
| HASTE | Hastemode (0= OFF, 1=ON) | 0 |
| RT | Round limit (in minutes) | 5 |
| ROUNDS | Rounds on a map | 5 |
| MINPLAYERS | Minimum players to start a round | 2 |
| TRAITORPCT | Traitor probability (in %) | 100 |
| TRAITORMAX | Maximum amount of traitors | 1 |
| DETPCT | Detective probability (in %) | 50 |
| DETMAX | Maximum amount of detectives | 1 |
| DETMIN | Minimum amount of players to play a detective | 5 |

## Use the console
```
docker exec -it ttt screen -x
```

## Volumes
Description of the docker volumes for this image.

| Volume name | Container mount | Description |
| --- | --- | --- |
| ttt-data | /app | All files for garrysmod. Do not change anything there. |
| ttt-config | /cfg | Put all your config files for garrysmod into here. All files are going to be copied from here into the /app/garrysmod folder. For example create a file with the path lua/autorun/server/admin_functions.lua on this volume. If you want your own server.cfg put it in cfg/server.cfg on this volume.
| ttt-content | /content | Path of Team Fortress 2 and Counter Strike: Source files which are for example necessary for many TTT maps. Do not change anything here. |

## Build information

Due to the fact, that garrysmod, etc are updated every time on the volumes a rebuild should not be necessary.

This image is build on https://github.com/Hackebein/docker-steamcmd for steamcmd.
