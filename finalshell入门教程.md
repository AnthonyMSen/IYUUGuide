# FinalShell入门教程

## 下载安装

进入FinalShell官网下载页面：

http://www.hostbuf.com/t/988.html

根据自己的电脑，选择对应版本下载并安装

## 添加终端配置

![](https://i.loli.net/2020/10/09/mzPpv5HsAaUVI1T.png)

选择添加`SSH连接`

![](https://i.loli.net/2020/10/09/OauZe8EJITCtw6K.png)

添加后，双击进行连接

## 认识界面

![](https://i.loli.net/2020/10/09/JWM3LzuEjTtGgaH.png)

在文件目录中，可以直接通过将文件拖拽进文件管理器的形式进行上传，双击文件可以直接打开编辑。

## 简单的命令

### cd 命令
```sh
# cd命令
cd ~ #进入该登录用户的home目录
cd - #进入上一个目录
cd /root #进入*绝对路径* /root
cd IYUUAutoReseed #进入相对路径 IYUUAutoReseed 
```

绝对路径，指在任何目录下都能访问的路径，

相对路径，指在当前目录下才能访问到的路径，

如：
```
root
|---A文件夹
|---B文件夹
|   |---B1.txt
|---C文件夹
```
场景一：我当前在A文件夹中，想访问B文件夹中的文件，那么只能通过绝对路径/root/B文件夹/B1.txt 来访问

场景二：我当前在B文件夹中，想访问B1.txt，则可直接使用B1.txt来访问

# [回到主页](https://github.com/AnthonyMSen/IYUUGuide)