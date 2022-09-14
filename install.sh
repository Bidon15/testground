#!/usr/bin/env sh
set -e
set -o pipefail

mkdir -p ~/testground && cd ~/testground

docker pull ghcr.io/bidon15/testground:edge
docker pull ghcr.io/bidon15/sync-service:edge
docker pull ghcr.io/bidon15/sidecar:edge

# At the moment this is the fastest way to get a pre-built testground binary.
docker run -v ${PWD}:/mount --rm --entrypoint cp ghcr.io/bidon15/testground:edge /testground /mount/testground

if [ -z $GITHUB_PATH ]; then
    echo "Testground was installed to ~/testground. Add this to your path."
else
    echo "~/testground" >> $GITHUB_PATH
fi