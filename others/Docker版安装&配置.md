# Docker版安装&配置

N1小钢炮已经安装了许多软件，所以很多东西不用我们单独设置，稍稍可以简化，但是！下面的步骤一点不能简化！请务必认真阅读！

如果你是Unraid用户，下面有些

## 安装IYUU

使用`finalshell`软件，连接设备

在电脑上下载 [文件](https://raw.githubusercontent.com/ledccn/IYUUAutoReseed/master/config/config.sample.php)（点击右键-下载；或者打开网址后全选，保存为`config.php`）

将下载好的文件重命名为`config.php`

在finalshell的界面，打开`/root`文件夹，直接将文件拖拽进`/root`文件夹，完成上传。

如果你想定时运行IYUU，请在[这个网页（点我跳转）](https://tool.lu/crontab/)中，输入`crontab表达式`；

下面列举出了几个常用的：
```sh
0 */12 * * * # 每12小时运行一次
0 */1 * * * # 每1小时运行一次
25 */1 * * * # 每个小时的25分运行一次
34 12 */1 * * # 每天12:34运行一次
0 8 * * 0 # 每周日早上8点运行一次
```

复制、修改下面的代码中的`cron`参数，在上文中寻找你需要定时运行的时间，在`finalshell`的终端中，右键-粘贴，回车运行：

```sh
docker run  -d \
--name IYUUAutoReseed \
-e cron='0 8 * * 0' \
-v /root/config.php:/config.php \
-v /var/lib/transmission/torrents:/torrents \
-v /var/lib/qbittorrent/.local/share/data/qBittorrent/BT_backup:/BT_backup \
--restart always \
iyuucn/iyuuautoreseed:arm64v8
```

unraid用户，根据你的CPU架构，选择合适的docker镜像，同样的，如果你要设置定时任务，请参考前文。如果你想转移做种，请参考N1小钢炮映射的`/torrents`目录和`/BT_backup`目录，

注！除N1小钢炮外，不推荐在docker中进行转移种子的操作！

x86：

```sh
docker run -d \
--name IYUUAutoReseed \
-e cron='0 9 * * 0' \
-v /root/config.php:/config.php \
--restart=always \
iyuucn/iyuuautoreseed:latest
```

ARM：
```sh
docker run -d \
--name IYUUAutoReseed \
-e cron='0 9 * * 0' \
-v /root/config.php:/config.php \
--restart=always \
iyuucn/iyuuautoreseed:arm64v8
```

## 配置`config.php`

1. 申请token [点我跳转](https://github.com/AnthonyMSen/IYUUGuide/blob/main/3.%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6%E7%BC%96%E8%BE%91.md#1%E7%94%B3%E8%AF%B7%E7%88%B1%E8%AF%AD%E9%A3%9E%E9%A3%9Etoken)

2. 配置做种客户端 [点我跳转](https://github.com/AnthonyMSen/IYUUGuide/blob/main/3.%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6%E7%BC%96%E8%BE%91.md#2%E5%A1%AB%E5%86%99%E4%B8%8B%E8%BD%BD%E5%AE%A2%E6%88%B7%E7%AB%AF%E4%BF%A1%E6%81%AF)

注意！docker、N1小钢炮用户必须填写`内网ip`，不能填写`127.0.0.1`

3. 填写合作站信息 [点我跳转](https://github.com/AnthonyMSen/IYUUGuide/blob/main/3.%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6%E7%BC%96%E8%BE%91.md#3%E5%A1%AB%E5%86%99%E5%90%88%E4%BD%9C%E7%AB%99%E4%BF%A1%E6%81%AF)

4. 填写剩余站点信息 [点我跳转](https://github.com/AnthonyMSen/IYUUGuide/blob/main/3.%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6%E7%BC%96%E8%BE%91.md#4%E5%A1%AB%E5%86%99%E5%89%A9%E4%BD%99%E7%AB%99%E7%82%B9%E4%BF%A1%E6%81%AF)

## 转移做种

1. 填写`'move'`参数 [点我跳转](https://github.com/AnthonyMSen/IYUUGuide/blob/main/5.%E8%BD%AC%E7%A7%BB%E5%81%9A%E7%A7%8D%E9%85%8D%E7%BD%AE.md#1move%E6%80%8E%E4%B9%88%E5%A1%AB)

2. N1小钢炮，`'type'`不用动，保持`0`，`'path'`也不需要动

3. 填最后三个参数 [点我跳转](https://github.com/AnthonyMSen/IYUUGuide/blob/main/5.%E8%BD%AC%E7%A7%BB%E5%81%9A%E7%A7%8D%E9%85%8D%E7%BD%AE.md#4%E6%9C%80%E5%90%8E%E7%9A%84%E4%B8%89%E4%B8%AA%E6%95%B0%E5%AD%97)

4. 配置完成，运行即可！