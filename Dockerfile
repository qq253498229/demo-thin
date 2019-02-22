FROM maven:3-jdk-8-alpine
WORKDIR /app
COPY src ./src
COPY pom.xml .
RUN mvn clean package

FROM openjdk:8-jre-alpine
COPY --from=0 /root/.m2 /root/.m2
COPY --from=0 /app/target/thin/root /thin/root
COPY --from=0 /app/target/app.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dthin.root=/thin/root","-jar","/app.jar"]