FROM openjdk:11.0.13-oraclelinux8

USER nobody:nobody

WORKDIR /app

ENV JAVA_OPTS "-XX:NativeMemoryTracking=summary -XX:+PrintNMTStatistics"

ENTRYPOINT [ "java", "-jar", "/app/spring-boot-initial-0.0.1-SNAPSHOT.jar" ]

COPY target/spring-boot-initial-0.0.1-SNAPSHOT.jar /app
