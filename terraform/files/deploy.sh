#!/bin/bash
set -e
source ~/.profile
git clone https://github.com/Artemmkin/reddit.git
cd reddit
bundle install

sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl enable puma
sudo systemctl start puma
