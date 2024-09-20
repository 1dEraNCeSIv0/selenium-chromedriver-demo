FROM eclipse-temurin:21.0.4_7-jdk

RUN apt-get update
RUN apt-get install dos2unix
RUN apt-get install unzip

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb || apt-get -y install -f

WORKDIR /root

RUN wget https://storage.googleapis.com/chrome-for-testing-public/129.0.6668.58/linux64/chromedriver-linux64.zip
RUN unzip ./chromedriver-linux64.zip

RUN mv ./chromedriver-linux64/chromedriver /usr/bin/chromedriver
RUN chmod +x /usr/bin/chromedriver
RUN dos2unix /usr/bin/chromedriver

COPY ./ /root

RUN chmod +x ./gradlew
RUN dos2unix ./gradlew
RUN ./gradlew clean testClasses

ENTRYPOINT ["/bin/bash", "-c"]
