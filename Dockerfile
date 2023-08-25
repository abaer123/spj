FROM openjdk:18.0.1
# MAINTAINER baeldung.com
COPY target/spring-petclinic-3.1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
