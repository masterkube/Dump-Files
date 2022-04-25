# to take backup and store in the date when the backup is taken
docker exec mysqldoc /usr/bin/mysqldump -u root --password=root masterkubedb > "$(date +"%Y_%m_%d_%I_%M_%p").sql"
cp "$(date +"%Y_%m_%d_%I_%M_%p").sql" .