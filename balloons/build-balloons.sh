#!/bin/bash
export PATH=$PATH:/root/.local/share/pnpm:/root/.nvm/versions/node/v22.14.0/bin
source /root/.bashrc

npm -v
node -v
pnpm -v

./gradlew --no-daemon -Pnpm.download=false shadowJar