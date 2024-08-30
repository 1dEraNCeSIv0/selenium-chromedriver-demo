FROM eclipse-temurin:21.0.4_7-jdk-alpine

RUN apk update
RUN apk add dos2unix
RUN apk add chromium=128.0.6613.84-r0 chromium-chromedriver=128.0.6613.84-r0

COPY ./ /root

WORKDIR /root
RUN chmod +x ./gradlew
RUN dos2unix ./gradlew
RUN ./gradlew clean testClasses

ENTRYPOINT ["/bin/sh", "-c"]
