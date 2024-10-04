FROM selenium/node-chrome:4.24.0

USER root

RUN apt-get update \
	&& apt-get -y install dos2unix openjdk-21-jdk

WORKDIR /root

COPY ./ /root

RUN chmod +x ./gradlew \
	&& dos2unix ./gradlew \
	&& ./gradlew clean testClasses

ENTRYPOINT ["/bin/bash", "-c"]
