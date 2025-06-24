# Use Gradle to build and run the JAR
FROM gradle:8.5-jdk17-alpine
WORKDIR /app

# Copy build files and source code
COPY build.gradle .
COPY settings.gradle .
COPY src ./src

# Build the application
RUN gradle build --no-daemon

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "build/libs/simple-gradle-java-app.jar"]