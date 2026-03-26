# sharelatex-5-deployment
官方的Overleaf Toolkit脚本太复杂了，各个变量来回倒腾，所以我发动大脑阅读bash代码的能力，我把它提取为docker-compose.yml文件，并且给出初始化mongo数据库的脚本。

PS. 官方写的脚本需要兼容各个版本的Sharelatex（Overleaf），mongo，redis。所以会采用大量的判断、分支、拼贴。

（此版本为2025上半年版，Overleaf还未进入6.0）

## 接下来会详细给出各参数的用途。

1. 要求 Overleaf 版本 5.x
2. 建议 MongoDB 版本 6.0
3. 建议 redis 版本 6.2

`NGINX_ENABLED=false'


## init_run.sh / normal_run.sh 中的注意事项
1. docker-compose指令是v1版本，如果无法运行，可用第二代docker compose指令代替。
2. 如果权限不够，在脚本前面加上sudo。
