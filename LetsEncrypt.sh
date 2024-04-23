#!/bin/bash

# This script must NOT be run as root. Some parts are for userspace.
#

if (( $EUID == 0 )); then
   echo "Do not run this script as root... you may be asked for"
   echo "  your password to sudo into root later in the"
   echo "  script, however."
   exit 1
fi

# Ensuring an update before progressing further.
sudo apt-get -qq update

# This script is based upon the following:
#   https://gist.github.com/tavinus/15ea64c50ac5fb7cea918e7786c94a95

# This will install a "projects" folder under as the current
#   running user. In the author's case, user "asmith".

# Per the guiding link given above...
#   Let's create a work folder

mkdir -p ~/projects && cd ~/projects

# Download acme.sh with git
git clone 'https://github.com/Neilpang/acme.sh.git'
cd acme.sh

read -p "What email will the Let's Encypt certificates be issued to?: " AccountEmail
read -p "What tld domain will the certificate be issued to (example.com)?: " TopLevelDomain
echo ""

# Install with account
./acme.sh --install --accountemail "$AccountEmail"

# In a future iteration, I will check to see if this was
#   properly installed into crontab.

# Go to the acme.sh installation folder
cd ~/.acme.sh

# Line by line, if it isn't there, ask for info then move on...
if grep -Fq account.conf -e "ACCOUNT_EMAIL"
then
   echo ""
   echo "We have an account email present. Confirm it is correct"
   echo "  by looking at ~/.acme.sh/account.conf"
else
   echo "ACCOUNT_EMAIL='$AccountEmail'" >> account.conf
fi

if grep -Fq account.conf -e "Dynu_ClientID"
then
   echo ""
   echo "We have a Dynu Client Id present. Confirm it is correct"
   echo "  by looking at ~/.acme.sh/account.conf"
else
   echo ""
   read -p "Please enter the Client ID line from https://www.dynu.com/en-US/ControlPanel/APICredentials" Dynu_ClientId
   echo "Dynu_ClientId='$Dynu_ClientId'" >> account.conf
fi

if grep -Fq account.conf -e "Dynu_Secret"
then
   echo ""
   echo "We have a Dynu Secret present. Confirm it is correct"
   echo "  by looking at ~/.acme.sh/account.conf"
else
   echo ""
   read -p "Please enter the Secret line from https://www.dynu.com/en-US/ControlPanel/APICredentials" Dynu_Secret
   echo "Dynu_Secret='$Dynu_Secret'" >> account.conf
fi

./acme.sh --debug --issue --dns dns_dynu -d $TopLevelDomain -d *.$TopLevelDomain

./acme.sh --debug --installcert -d $HOSTNAME.$TopLevelDomain --keypath /etc/pve/local/pveproxy-ssl.key --fullchainpath /etc/pve/local/pveproxy-ssl.pem --reloadcmd "systemctl restart pveproxy"

# EOF
