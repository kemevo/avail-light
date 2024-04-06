# Delete old installations:
```
sudo systemctl stop availd && sudo systemctl disable availd && sudo rm /etc/systemd/system/availd* && sudo systemctl daemon-reload && rm -rf $HOME/avail-light
```
# Screen install:
```
sudo apt install screen
```
```
screen -S avail
```
# Auto install:
```
wget -O availoto.sh https://raw.githubusercontent.com/kemevo/avail-light/main/availoto.sh && chmod +x availoto.sh && ./availoto.sh
```
# Check node:
```
curl -I "localhost:7000/health"
```
