#!/bin/bash
exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
echo ''
else
  sudo apt update && sudo apt install curl -y < "/dev/null"
fi

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

echo -e "Starting service... \e[0m" && sleep 1
# create service
sudo tee /etc/systemd/system/availd.service > /dev/null <<EOF
[Unit]
Description=Avail Light Client
After=network.target
StartLimitIntervalSec=0
[Service]
User=root
ExecStart=/root/avail-light --identity /root/identity.toml --network goldberg
Restart=always
RestartSec=120
[Install]
WantedBy=multi-user.target
EOF

# start service
sudo systemctl daemon-reload
sudo systemctl enable availd
sudo systemctl restart availd
sleep 1
sudo journalctl -u availd -fo cat

