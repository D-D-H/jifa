FROM node:18
RUN apt-get update && apt-get install openjdk-17-jdk -y
WORKDIR /workspace/
COPY . /workspace/
ARG ECLIPSE_MAT_DEPS_OS
ARG ECLIPSE_MAT_DEPS_ARCH
RUN --mount=type=cache,target=/root/.gradle ./gradlew clean build -x test -Declipse-mat-deps.os=${ECLIPSE_MAT_DEPS_OS} -Declipse-mat-deps.arch=${ECLIPSE_MAT_DEPS_ARCH}
RUN mkdir -p server/build/dependency && (cd server/build/dependency; jar -xf ../libs/jifa.jar)