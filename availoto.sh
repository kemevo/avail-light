#!/bin/bash
exists()
{
  command -v "$1" >/dev/null 2>&1
}

echo 'seed kelimeleri girin'
read -r -p "seed:" kelimeler
sleep 0.5
touch identity.toml
echo "avail_secret_seed_phrase = '${kelimeler}'" > identity.toml

# Update system and install  tools
sudo apt update
sudo apt-get install make clang pkg-config libssl-dev build-essential
sleep 1
sudo apt-get update
sleep 1

cd $HOME
wget https://github.com/availproject/avail-light/releases/download/v1.7.10/avail-light-linux-amd64.tar.gz
sleep 1
tar -xvzf avail-light-linux-amd64.tar.gz
mv avail-light-linux-amd64 avail-light
rm -rf avail-light-linux-amd64.tar.gz
sleep 1

curl -sL1 avail.sh | bash -s -- --network goldberg --identity /root/identity.toml
