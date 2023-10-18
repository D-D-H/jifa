FROM node:18
RUN apt-get update && apt-get install openjdk-17-jdk -y
WORKDIR /workspace/
COPY . /workspace/
RUN --mount=type=cache,target=/root/.gradle ./gradlew clean build -x test
RUN mkdir -p server/build/dependency && (cd server/build/dependency; jar -xf ../libs/jifa.jar)