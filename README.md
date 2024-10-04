This branch demonstrates the error using the selenium/node-chrome image version `4.23.0`.

## How to reproduce
1. clone the repository to a machine with docker
2. navigate to the project root directory
3. run `docker build -t <image-name> .`
4. run `docker run <image-name> "/root/gradlew -i test"`
5. Wait. The failure is due to a timeout, seems to take around 3minutes on average

## Image versions known to work:
* `4.22.0` (contains Chrome 126)

## Image versions known to fail:
* `4.23.0` (contains Chrome 127)
* `4.24.0` (contains Chrome 128)
