FROM ubuntu

# Install apt dependencies
RUN apt-get update
RUN apt-get install -y openjdk-17-jdk gradle git curl

# Install node (nvm) and pnpm
COPY ./install-npm.sh /install-npm.sh
RUN bash /install-npm.sh

# Install code
RUN mkdir /tools
WORKDIR /tools
RUN git clone https://github.com/icpc/live-v3.git

# Build
WORKDIR /tools/live-v3
RUN gradle wrapper --gradle-version=8.13

COPY ./build-live-v3.sh ./build.sh
RUN bash ./build.sh

CMD ["tail", "-f", "/dev/null"]