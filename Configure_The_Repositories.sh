#!/bin/bash

# To get the official repositories provided by ubuntu we can have a look at the following file where the defaults for the system are defined
cat /etc/apt/sources.list

# There are multiple lines that follow the below naming convention in the file
# Deb at the begining tells the system that the link repository contains file repositories that use the .deb naming convention
# The url is the location where the files are held
# focal is the code name for this ubuntu distribution
# after the code name we can have main, universe, multiverse and restricted points to a component of the code name
deb http://ae.archive.ubuntu.com/ubuntu/ focal main restricted

# Let's install the latest version of docker that is compatible with our OS but not provided in the default ubuntu repositories
# First we try to remove any conflicting pakages and software that may be present in our system
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Second we download the public key using curl
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings

# Third we dearmor the key using gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Fourth step involves adding the repository to Apt sources:
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# The fifth step is to update the system package database to confirm that the new repo file we added
sudo apt-get update

# We can now check the docker.list file, in future if we don't need docker we can remove this file from our system
cat /etc/apt/sources.list.d/docker.list

# To add a personla package repo
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update -y

# To remove any PPAs that we might have added we can use the 
sudo add-apt-repository --remove ppa:graphics-drivers/ppa
sudo apt update -y
