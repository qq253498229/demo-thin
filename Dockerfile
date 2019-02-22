FROM maven:3-jdk-8-alpine
COPY pom.xml .
RUN mvn clean package

FROM maven:3-jdk-8-alpine
WORKDIR /app
COPY --from=0 /root/.m2 /root/.m2
COPY src ./src
COPY pom.xml .
RUN mvn clean package

FROM java:8-jre-alpine
COPY --from=1 /root/.m2 /root/.m2
COPY --from=1 /app/target/app.jar /app.jar
COPY --from=1 /app/target/thin/root /thin/root
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dthin.root=/thin/root","-jar","/app.jar"]