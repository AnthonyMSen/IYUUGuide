BACKUP_HOME="<自己创建一个新的备份文件夹>"
TR_BACKUP_HOME="<实际的transmission/config文件夹>"

if [ ! -d $BACKUP_HOME/torrents ] || [ ! -d $BACKUP_HOME/resume ];then
echo backup_file_not_exist
exit 0
fi

cd ${TR_BACKUP_HOME}
rm resume -rf
rm torrents -rf
echo delete_folder_complete

cp -r ${BACKUP_HOME}/resume ${TR_BACKUP_HOME}
cp -r ${BACKUP_HOME}/torrents ${TR_BACKUP_HOME}
echo recover_mission_complete

# 更改文件权限
chown -R sc-transmission:transmission ${TR_BACKUP_HOME}/resume
chown -R sc-transmission:transmission ${TR_BACKUP_HOME}/torrents
chmod 755 ${TR_BACKUP_HOME}/resume
chmod 755 ${TR_BACKUP_HOME}/torrents
chmod 600 ${TR_BACKUP_HOME}/resume/*.resume
chmod 600 ${TR_BACKUP_HOME}/torrents/*.torrent
echo change_permissions_complete
