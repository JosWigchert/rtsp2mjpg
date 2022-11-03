#!/bin/bash

trap "exit" INT TERM ERR
trap "kill 0" EXIT

echo "Starting RTSP to HTTP server"

ffserver -hide_banner -loglevel ${FFSERVER_LOG_LEVEL} &

urls=$(echo $RTSP_URL | tr ";" "\n")
i=1

for URL in $urls
do
    echo "Piping to port $i > [$URL] --> [http://127.0.0.1:8090/feed${i}.ffm]"
    ffmpeg -nostdin -hide_banner -loglevel ${FFMPEG_LOG_LEVEL} -rtsp_transport tcp ${FFMPEG_INPUT_OPTS} -i ${URL} ${FFMPEG_OUTPUT_OPTS} http://127.0.0.1:8090/feed${i}.ffm &
    i=$((i+1))
done

echo 'Done'

while true;
do
	sleep 5
done