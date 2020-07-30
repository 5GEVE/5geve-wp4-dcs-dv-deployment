#!/bin/bash

echo [Unit] | sudo tee -a /etc/systemd/system/dcs.service > /dev/null
echo Description=DCS REST Client | sudo tee -a /etc/systemd/system/dcs.service > /dev/null
echo | sudo tee -a /etc/systemd/system/dcs.service > /dev/null
echo [Service] | sudo tee -a /etc/systemd/system/dcs.service > /dev/null
echo User=$1 | sudo tee -a /etc/systemd/system/dcs.service > /dev/null
echo ExecStart=/usr/bin/sudo /usr/bin/python3 /usr/bin/dcs/dcs-python/dcs_rest_client.py --dcm_ip_address $2 --eve_db_password $3 --port 8091 --log info | sudo tee -a /etc/systemd/system/dcs.service > /dev/null
echo | sudo tee -a /etc/systemd/system/dcs.service > /dev/null
echo [Install] | sudo tee -a /etc/systemd/system/dcs.service > /dev/null
echo WantedBy=default.target | sudo tee -a /etc/systemd/system/dcs.service > /dev/null

sudo chmod 664 /etc/systemd/system/dcs.service
sudo systemctl daemon-reload
sudo systemctl enable dcs.service
