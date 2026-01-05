# -------- BUILD STAGE --------
FROM eclipse-temurin:25-jdk AS build
WORKDIR /build
COPY expensetracker ./expensetracker
WORKDIR /build/expensetracker
RUN ./mvnw clean package -DskipTests

# -------- RUN STAGE --------
FROM eclipse-temurin:25-jre
WORKDIR /app
COPY --from=build /build/expensetracker/target/*.jar app.jar

ENV JAVA_OPTS="-XX:+UseZGC -XX:MaxRAMPercentage=75"
EXPOSE 9090
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
