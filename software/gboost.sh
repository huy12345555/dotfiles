#!/bin/bash

systemctl start throttlestop throttlestop.timer 
sudo wrmsr 0x1FC 0xFFFFE 
systemctl stop mssql-server
sudo apt update 
sudo apt upgrade -y 
flatpak update -y
sudo apt autoremove -y

exit 0
