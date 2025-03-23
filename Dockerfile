FROM eclipse-temurin:22-jdk

ARG GRADLE_VERSION=8.8

ENV PORT=8080

RUN apt-get update && apt-get install -yq make unzip

#WORKDIR /app

COPY gradle gradle
COPY app/build.gradle.kts app/
COPY settings.gradle.kts .
COPY gradlew .

RUN ./gradlew --no-daemon dependencies

COPY app app

RUN ./gradlew --no-daemon build

ENV JAVA_OPTS "-Xmx512M -Xms512M"
EXPOSE ${PORT}

CMD java -Dspring.profiles.active=production -jar app/build/libs/app.jar
