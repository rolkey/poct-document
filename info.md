# 项目信息

## 环境

* 后台：基于spring-cloud的诺依cloud-plus，在./poct-lis项目中
* 前端：vue微前端项目在./poct-frontend项目中

## 数据库

* 数据库连接参数1：（容器：cloud-mysql8）
 
```yaml
数据库连接参数1：
  url: jdbc:mysql://192.168.168.128:3306/ry-cloud
  user: ruoyi
  password: Ruoyi@111
```

* 数据库连接参数2：（容器：cloud-postgres）

```yaml
数据库连接参数2：
  url: jdbc:postgresql://192.168.168.128:5432/his-lis?ssl=false&TimeZone=Asia/Shanghai
  user: postgres
  password: root
  driver-class-name: org.postgresql.Driver
```

## 目录变更 

* poct-ui-lis，poct-ui-person，poct-ui-qc合并到poct-frontend项目中
