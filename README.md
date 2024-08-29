This repository is a demonstration of selenium test failures with
1. chromium / chromedriver 128
2. specifying `--headless=new`
3. in a docker container

## How to reproduce
1. clone the repository to a machine with docker
2. navigate to the project root directory
3. run `docker build -t <image-name> .`
4. run `docker run <image-name> "/root/gradlew -i test"`
5. Wait. The failure is due to a timeout, took a bit less than 5 minutes when I stopped the time

Note that the project has 2 tests
* One test with `--headless=new` and which fails and is very prominent in the docker logs
* One test with `--headless=old` which runs successfully and is easy to miss in the logs
