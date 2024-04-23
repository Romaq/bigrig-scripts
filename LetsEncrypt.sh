#!/bin/bash

# This script must be run as root
#
# Root access is required for updating aptitude packages
#   as well as hard-coding system variables. If your plan
#   is to use an email appliance, do not use this script.
#   Rather, this is an exercise outside of the scope of
#   the BigRig-Scripts project.

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Ensuring an update before progressing further.
apt-get -qq update

# This script is based upon the following:
#   https://gist.github.com/tavinus/15ea64c50ac5fb7cea918e7786c94a95

# This will install a "projects" folder under root. As I
#   learn scripting, I plan to run the script as user so
#   ~user/projects will be valid at some point in the
#   future. For now, if you wish to work with the acme.sh
#   scripts in your ~user/projects folder, you will need
#   to discover this on your own.

# Per the guiding link given above...
#   Let's create a work folder

mkdir -p /root/projects && cd /root/projects

# Download acme.sh with git
git clone 'https://github.com/Neilpang/scme.sh.git'
cd acme.sh

read -p "What email will the Let's Encypt certificates be issued to?: " AccountEmail
echo ""

# Install with account
./acme.sh --install --accountemail "$AccountEmail"

# In a future iteration, I will check to see if this was
#   properly installed into crontab.

# Go to the acme.sh installation folder
cd /root/acme.sh

# Line by line, if it isn't there, ask for info then move on...
if grep -Fq /root/.acme.sh/account.conf -e "ACCOUNT_EMAIL"
then
   echo "We have an account email present. Confirm it is correct"
   echo "  by looking at /root/.acme.sh/account.conf"
else
   echo "ACCOUNT_EMAIL='$AccountEmail' >> /root/.acme.sh/account.conf
fi

# EOF
