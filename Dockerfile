FROM registry.cn-beijing.aliyuncs.com/wangdali/demo-thin-jar:latest

FROM registry.cn-beijing.aliyuncs.com/wangdali/demo-thin-jar:latest
WORKDIR /app
COPY src ./src
RUN mvn clean package

FROM openjdk:8-jre-alpine
COPY --from=0 /app/target/thin/root /thin/root
COPY --from=1 /app/target/app.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dthin.root=/thin/root","-jar","/app.jar"]