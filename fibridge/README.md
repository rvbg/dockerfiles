# rvbg/fibridge
With [fibridge](https://github.com/anderspitman/fibridge-proxy-rs) you can send files over the Internet without first uploading them to a central server.

This image is a multi-arch image which runs on x86-64, arm, arm64.

## Example use

    docker run --name fibridge -p 8080:80 -d rvbg/fibridge

## Environment variables
| ENV | Description | Default value |
|--|--|--|
| IP | The IP address the server is listening on. You maybe need to use this variable if you do not use the Docker network bridge. | $(awk 'END{print $1}'  /etc/hosts) |
| PORT | The port the server is listening on. | 80 |

## Notes
fibridge actually offers native HTTPS support which I deliberately did not take over with this container. Please use a reverse proxy for this.