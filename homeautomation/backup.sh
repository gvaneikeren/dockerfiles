mkdir /home/gert/backups/temp
#cd /home/gert/dockercompose
docker-compose down
#cd /home/gert/octoprint
#docker-compose down
tar -vczf /home/gert/backups/temp/nodered$(date +%Y-%m-%d-%H-%M).tar.gz /home/gert/nodered/ 
tar -vczf /home/gert/backups/temp/bitwarden$(date +%Y-%m-%d-%H-%M).tar.gz /home/gert/bitwarden/
tar -vczf /home/gert/backups/temp/ha$(date +%Y-%m-%d-%H-%M).tar.gz /home/gert/ha/
tar -vczf /home/gert/backups/temp/mosquitto$(date +%Y-%m-%d-%H-%M).tar.gz /home/gert/mosquitto/
tar -vczf /home/gert/backups/temp/ozw$(date +%Y-%m-%d-%H-%M).tar.gz /home/gert/ozw/
tar -vczf /home/gert/backups/temp/motioneye$(date +%Y-%m-%d-%H-%M).tar.gz /home/gert/motioneye/
tar -vczf /home/gert/backups/temp/ha-mariadb$(date +%Y-%m-%d-%H-%M).tar.gz /home/gert/ha-mariadb/
tar -vczf /home/gert/backups/temp/dockercompose$(date +%Y-%m-%d-%H-%M).tar.gz /home/gert/dockercompose/
tar -vczf /home/gert/backups/temp/octoprint$(date +%Y-%m-%d-%H-%M).tar.gz /home/gert/octoprint/

#cd /home/gert/dockercompose
docker-compose up -d
#cd /home/gert/octoprint
#docker-compose up -d

tar --remove-files -vczf /home/gert/backups/backup$(date +%Y-%m-%d-%H-%M).tar.gz /home/gert/backups/temp

docker run  -v /home/gert/backups/:/backup/  --rm minidocks/lftp lftp -c "set ssl:verify-certificate false; open 192.168.1.12; login admin voeding; cd domobackups;mirror -R -e /backup/ /domobackups/"

cd /home/gert/backups
ls -tp | grep -v '/$' | tail -n +7 | while IFS= read -r f; do rm -f "$f"; done

