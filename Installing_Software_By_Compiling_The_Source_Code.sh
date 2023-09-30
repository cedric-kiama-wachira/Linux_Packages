#!/bin/bash

# Getting started with downloading source code from repository that is human readable, then we have to compile it and make it machine readable as well
# We will use an example of such a code from github.
# First is to install git
sudo apt install git -y

# Second is to downlod the code from the repo
git clone https://github.com/htop-dev/htop.git

# Third is to install the libraries needed by HTOP, the exact details can be found from the README.md file
sudo apt install libncursesw5-dev autotools-dev autoconf automake build-essential

# Fourth step from the README.md file is to run the below to generate a configuration script
cd htop;
./autogen

# Fifth is to run configure 
./configure

# Sixth step is to run make as below
make 

# Sevent step is to make the htop application accessible without typing the full path when invoking it
sudo make install