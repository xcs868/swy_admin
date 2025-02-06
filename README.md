# swy_admin

### 介绍

游戏后台项目 games-admin

- 前端地址
    - 开发：
    - 测试：
    - 预发：
    - 生产：
    - 海外：

### 环境要求

> php8.1+ && swoole 5.1.3 && composer2

### 运行

容器运行
> cp docker/docker-compose.local.yml docker/docker-compose.yml

> docker-compose -f k8s/docker-compose.yml

物理机运行

> php watch -c

### 环境配置

- `local` 本地环境
- `development` 开发环境
- `test` 测试环境
- `pre` 预发布环境
- `product` 生产环境
- `testing` 单元测试环境

> cp ./env/.env.local .env
>
> 本地配置地址: .env 文件

### 代码规范
1. 代码格式化,遵循 PSR-2代码规范.命令composer cs用于检查是否复核规范,如存在可尝试使用composer cs-fix 自动格式化代码.如不能解决,请手动编辑

2. 代码质量检查, 运行命令 composer analyse, 如有问题,不能提交代码,修改符合标准后提交

## 开发建议

### 问题总结
1. 《工具-代码生成器》该功能实际上基于扩展包 `hyperf/devtool` 来实现的，所以生产环境禁用
2. 运行环境的代码改了实时生效【生产环境禁用】

    ```shell
    # 参考 ./k8s/dev.Dockerfile
    php watch -c 
    ```
    > 具体配置看 `./watch` 文件

