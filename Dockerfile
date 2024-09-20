FROM eclipse-temurin:21.0.4_7-jdk

RUN apt-get update
RUN apt-get install dos2unix

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb || apt-get -y install -f

WORKDIR /root

RUN apt-get -y install npm
RUN npx --yes @puppeteer/browsers install chromedriver@stable \
    | sed 's/.* //g' \
    | xargs -I '{}' mv {} /usr/bin/chromedriver

RUN chmod +x /usr/bin/chromedriver
RUN dos2unix /usr/bin/chromedriver

COPY ./ /root

RUN chmod +x ./gradlew
RUN dos2unix ./gradlew
RUN ./gradlew clean testClasses

ENTRYPOINT ["/bin/bash", "-c"]
