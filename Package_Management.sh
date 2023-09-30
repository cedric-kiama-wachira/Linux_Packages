#!/bin/bash

# We need to update the software due to changes or updates that may have
# occured from the official repositories 
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y

# To install Nginx server we can use below command
sudo apt update -y && sudo apt install nginx -y

# To list the files included in it we use below low level tool
sudo dpkg --listfiles nginx
