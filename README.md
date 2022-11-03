### RTSP to MJPEG stream conversion using FFmpeg and FFserver

Below are the environmental variables available and their default value. Override them as needed.

| Variables            | Default                                                      |
|----------------------|:------------------------------------------------------------:|
| `RTSP_URL`           | rtsp://onvif:onvif@169.254.5.232//onvif-media/media.amp      |
| `FFSERVER_LOG_LEVEL` | error                                                        |
| `FFMPEG_LOG_LEVEL`   | warning                                                      |
| `FFMPEG_INPUT_OPTS`  | `empty`                                                      |
| `FFMPEG_OUTPUT_OPTS` | `empty`                                                      |


#### Output

For camera 1
Live stream: `http://<IP>:8090/live1.mjpg`  
Still snapshot: `http://<IP>:8090/still1.jpg`

For camera 2
Live stream: `http://<IP>:8090/live2.mjpg`  
Still snapshot: `http://<IP>:8090/still2.jpg`
...

*The ffserver.conf values are set for Wyze Cam V2 output. If you need to customize it you can pull the source and build with your own values.*


#### Docker Compose

- Clone the repo
- Edit docker-compose.yaml for any customizations needed
- Launch the containers using `docker-compose up -d`
- To add or change cameras change the RTSP_URL variable in the `docker-compose.yaml` file with all the camera URIs `;` seperated

There will be an nginx container included to proxy ffserver. I find that it handles situations where the ffserver backend becomes unresponse better with a timeout reponse.

With docker-compose, the output can be accessed via:

Live stream: `http://<IP>/live.mjpg`   
Still snapshot: `http://<IP>/still.jpg`   
