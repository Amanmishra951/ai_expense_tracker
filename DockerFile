FROM eclipse-temurin:25-jre

WORKDIR /app

# Copy jar (same as before, but flexible)
COPY target/*.jar app.jar

# JVM options safe for Netty + AI features
ENV JAVA_OPTS="-XX:+UseZGC -XX:MaxRAMPercentage=75"

EXPOSE 9090

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
FROM eclipse-temurin:25-jre

WORKDIR /app

# Copy jar (same as before, but flexible)
COPY target/*.jar app.jar

# JVM options safe for Netty + AI features
ENV JAVA_OPTS="-XX:+UseZGC -XX:MaxRAMPercentage=75"

EXPOSE 9090

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
