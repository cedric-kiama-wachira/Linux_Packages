#!/bin/bash

# To check what software need's updating
sudo dnf check-upgrade

# To upgrade all the latest software
sudo dnf upgrade -y

# Managing software in Centos or Redhat to get the defaults
sudo dnf repolist

# To get detailed information we can use the above command with the -v option
sudo dnf repolist -v

# To get a detailed list of repositories that we can enable we can use
sudo dnf repolist --all

# To enable a repository we can use
sudo dnf config-manager --enable codeready-builder-for-rhel-9-rhui-debug-rpms
sudo dnf config-manager --enable codeready-builder-for-rhel-9-rhui-rpms
sudo dnf onfig-manager  --enable codeready-builder-for-rhel-9-rhui-source-rpms

# To disable it we can use
sudo dnf config-manager --disable codeready-builder-for-rhel-9-rhui-debug-rpms
sudo dnf config-manager --disable codeready-builder-for-rhel-9-rhui-rpms
sudo dnf onfig-manager  --disable codeready-builder-for-rhel-9-rhui-source-rpms

# To add a repository from a third party provider like docker we can use the following command
sudo dnf install gnome-terminal -y
sudo dnf -y install dnf-plugins-core -y 
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Get our OS specific version
sudo yum install docker-ce

# Linux post-installation steps for Docker Engine
sudo usermod -aG docker $USER
newgrp docker

#If prompted to accept the GPG key, verify that the fingerprint matches
#Start Docker.
sudo systemctl start docker

# Verify that the Docker Engine installation is successful by running the hello-world image.
docker run hello-world

# If we accidentally removed a package and need to reinstall it we can use
sudo dnf reinstall nginx

# To unistall a package we can use the
sudo dnf remove nginx

# To install packages easier there is a group install option, first we need to list the groups
sudo dnf group list

# Then we can install from below group as follows
#Available Environment Groups:
#   Server with GUI
#   Server
#   Minimal Install
#   Workstation
#   Virtualization Host
#   Custom Operating System
#Available Groups:
#   Console Internet Tools
#   Container Management
#   RPM Development Tools
#   .NET Development
#   System Tools
#   Headless Management
#   Smart Card Support
#   Legacy UNIX Compatibility
#   Security Tools
#   Network Servers
#   Scientific Support
#   Graphical Administration Tools
#   Development Tools
sudo dnf group install "Development Tools" -y

# To install the group with options
sudo dnf group install --with-optional "Development Tools"-y

# To remove the group
sudo dnf group remove "Development Tools" -y 

# To see more available groups apart from the default ones
sudo dnf group list --hidden

# To delete a package plus its dependencies we can use
sudo dnf autoremove -y

# To get a history of all dnf related command we can use
sudo dnf history