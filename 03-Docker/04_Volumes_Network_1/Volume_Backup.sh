#!/bin/bash
# Backup volume
docker run --rm -v backup-test:/data -v $(pwd):/backup alpine:latest tar czf
/backup/volume_backup.tar.gz -C /data .
ls -lh volume_backup.tar.gz > backup_info.txt
# Restore to new volume
docker volume create restore-test
docker run --rm -v restore-test:/data -v $(pwd):/backup alpine:latest tar xzf
/backup/volume_backup.tar.gz -C /data
docker run --rm -v restore-test:/data alpine:latest cat /data/file.txt >
restored_data.txt
