#!/bin/bash

# We need to update the software due to changes or updates that may have
# occured from the official repositories 
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y

# To install Nginx server we can use below command
sudo apt update -y && sudo apt install nginx -y

# To list the files included in it we use below low level tool
sudo dpkg --listfiles nginx

# To list more on  one of the following NEW packages installed:
#  libnginx-mod-http-image-filter libnginx-mod-http-xslt-filter libnginx-mod-mail libnginx-mod-stream nginx nginx-common nginx-core
sudo dpkg --listfiles nginx-core

# If curious and we need to get more information of the additional packages installes as part of the nginx installation we can use
sudo apt show libnginx-mod-stream

# To get all package details that have the name nginx excluding description
sudo apt search --names-only nginx

# To get packages with specific names
sudo apt search nginx module image

# To remove a package that is no longer required
sudo apt remove nginx -y

# To remove packages that are no longer needed after removing the main package above
# The following packages were automatically installed and are no longer required:
# libnginx-mod-http-image-filter libnginx-mod-http-xslt-filter libnginx-mod-mail libnginx-mod-stream nginx-common nginx-core
sudo apt autoremove -y

# Lets install Nginx again and see how to remove it plus its dependencies
sudo apt install nginx -y

# To remove Nginx plus its dependent packages
sudo apt autoremove nginx -y 
