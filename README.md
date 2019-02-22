# Spring Boot项目分离应用和依赖包，降低修改时的文件大小

分离源码jar包和依赖jar包，解决每次mvn package都会重新提交所有依赖的问题

在mvn package之后会在 *target* 目录出现yourapp.jar文件和thin目录，thin目录就是依赖所在目录，yourapp.jar就是应用的包。
这样只需要在第一次部署以及下次修改了pom.xml文件时才需要上传依赖，其余修改只需上传yourapp.jar即可，大幅减小文件大小(当前仅为11Kb)。

启动命令:

```bash
java -Dthin.root=thin/root -jar yourapp.jar 
```

在Docker中需要首先将依赖构建一个镜像，然后在构建应用的时候从依赖的镜像中获取即可。
其中./Dockerfile为应用的docker build文件，./jar/Dockerfile为依赖的docker build文件