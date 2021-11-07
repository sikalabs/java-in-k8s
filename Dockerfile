FROM openjdk:11.0.13-oraclelinux8

USER nobody:nobody

WORKDIR /srv

ENV JAVA_OPTS "-XX:NativeMemoryTracking=summary -XX:+PrintNMTStatistics"

ENTRYPOINT [ "java", "-jar", "/srv/spring-boot-initial-0.0.1-SNAPSHOT.jar" ]

COPY target/spring-boot-initial-0.0.1-SNAPSHOT.jar /srv

# RUN mv /srv/spring-boot-initial-0.0.1-SNAPSHOT.jar /srv/app.jar
