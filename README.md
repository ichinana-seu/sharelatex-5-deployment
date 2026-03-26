# sharelatex-5-deployment
官方的Overleaf Toolkit脚本太复杂了，各个变量来回倒腾，所以我发动大脑阅读bash代码的能力，我把它提取为docker-compose.yml文件，并且给出初始化mongo数据库的脚本。

PS. 官方写的脚本需要兼容各个版本的Sharelatex（Overleaf），mongo，redis。所以会采用大量的判断、分支、拼贴。

（此版本为2025上半年版，Overleaf还未进入6.0）

## 接下来会详细给出各参数的用途。

1. 要求 Overleaf 版本 5.x
2. 建议 MongoDB 版本 6.0
3. 建议 redis 版本 6.2


```
MONGO_ENABLED=true
REDIS_ENABLED=true
REDIS_AOF_PERSISTENCE=true
```

```
NGINX_ENABLED=false
GIT_BRIDGE_ENABLED=false
SIBLING_CONTAINERS_ENABLED=false
```


## 脚本中的注意事项
1. docker-compose指令是v1版本，如果无法运行，可用第二代docker compose指令代替。
2. 如果权限不够，在自行修改脚本，docker命令前面加上sudo。

## 步骤
1. Move all files to `~/envs/vmdata/overleaf_toolbox_config/` .
2. Edit `docker-compose.yml` and `variables.env` file as you like. For instance, (1) sharelatex image can be set to "arthurlefloch/sharelatex-arm:10.0.1" for arm64. (2) sharelatex image can be set to "sharelatex/sharelatex:5" for offical x86_64 images.
3. `docker pull mongo:6.0` and `docker pull redis:6.2` .
4. Run script `./init.sh` for initiating Mongo replica set (attention, must).
5. Run script `./up.sh` .
6. visit `http://localhost:80/launchpad` to register an ADMIN account.

## 步骤(postscripts)
1. Run script `./stop.sh` to pause.
2. Run script `./start.sh` to start from pause.
3. Run script `./stop_and_down.sh` to delete docker containers. 
