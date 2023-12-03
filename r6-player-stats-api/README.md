# rvbg/r6-api:api
This image is a dockerized version of [Seems2Legit/Rainbow-Six-Siege-Player-Stats-API](https://github.com/Seems2Legit/Rainbow-Six-Siege-Player-Stats-API).
There you will also find instructions on how to use this API.

## Example use

    docker run --name r6-api -e APPCODE='' -e EMAIL='' -e PASSWORD='' -p 80:80 -d rvbg/r6-api:api

## Required environment variables
| ENV | Description |
|--|--|
| APPCODE | The code to access the api. Do not use spaces. |
| EMAIL | Ubisoft mail address. Consider to create an account just for the api. |
| PASSWORD | The associated password to that account. |

## Optional environment variables
| ENV | Description | Default value |
|--|--|--|
| REGION | Regions: emea - ncsa - apac | emea |
| STATS | Default stats to output in an empty request. Not that interesting. | casualpvp_death |
| PLATFORM | Platforms: uplay - xbl - psn  | uplay |
| PROGRESSION | Select if you want to see extra info like level or xp. | true |
