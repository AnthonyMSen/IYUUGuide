观察脚本中的内容开头：

```sh
BACKUP_HOME="<自己创建一个新的备份文件夹>"
TR_BACKUP_HOME="<实际的transmission/config文件夹>"
```

按自身文件目录结构填写好，要确保两个文件的这一部分是一样的，否则无法恢复！

config文件夹中应包含`torrents`和`resume`这两个文件夹，可以由此判断你是否找对了位置。

运行时，可以用以下命令：

```sh
# 备份tr
bash tr_backup.sh

# 恢复tr
bash tr_recover.sh
```

如果你知道如何找到这两个文件的绝对路径，那么就可以完整的写成类似：

```sh
# !!!请根据自身实际情况来!!!
bash /root/tr_backup/tr_backup.sh
# !!!该示例代码仅代表我的配置环境!!!
```