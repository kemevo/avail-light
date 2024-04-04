# Delete old installations:
```
sudo systemctl stop availd && sudo systemctl disable availd && sudo rm /etc/systemd/system/availd* && sudo systemctl daemon-reload && rm -rf $HOME/avail-light
```
# Auto install:
```
wget -O availoto.sh https://raw.githubusercontent.com/kemevo/avail-light/main/availoto.sh && chmod +x availoto.sh && ./availoto.sh
```
