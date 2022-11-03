docker-compose down
docker rmi csi/rtsp2mjpg:latest
docker build -t csi/rtsp2mjpg .
docker-compose up -d