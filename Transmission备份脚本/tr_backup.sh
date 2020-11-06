#!/bin/bash
BACKUP_HOME="<自己创建一个新的备份文件夹>"
TR_BACKUP_HOME="<实际的transmission/config文件夹>"
echo 1
cd ${BACKUP_HOME}
if [ ! -d "./backups" ]; then
mkdir backups
fi

cd backups
if [ ! -d "./transmission" ]; then
mkdir transmission
fi

cd transmission
if [ ! -d "./backup_old" ];then
mkdir backup_old
fi

if [ ! -d "./backup_new" ];then
mkdir backup_new
fi

rm -rf ./backup_old
echo old_backup_deleted
mv ./backup_new ./backup_old
mkdir backup_new
cp -r ${TR_BACKUP_HOME}/resume $BACKUP_HOME/backups/transmission/backup_new
cp -r ${TR_BACKUP_HOME}/torrents $BACKUP_HOME/backups/transmission/backup_new
echo backup_mission_complete
