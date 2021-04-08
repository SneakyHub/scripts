#!/bin/bash

sudo echo "==================================================="
sudo echo ""
sudo echo "Thank you for using Sneaky's Ptero Auto Updater! <3"
sudo echo ""
sudo echo "              Made with Love <3"
sudo echo "      Made for and tested on Ubuntu 18.04"
sudo echo "          Auto Updating Ptero Wings"
sudo echo ""
sudo echo ""
sudo echo "        THIS SCRIPT WILL START IN 30 SECONDS"
sudo echo "      DO CTRL + C TO CANCEL IF RAN BY MISTAKE!!"
sudo echo ""
sudo echo "==================================================="

sleep 3

# Base Directory
sudo echo "Moving to Base Directory to start Update Process."
cd /usr/local/bin
sleep 3

# Downloading Update
sudo echo "Downloading Update Files."
sudo curl -L -o /usr/local/bin/wings https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
sudo echo "Download Completed!"
sleep 3

# Updating Permissions
sudo echo "Moving onto updating permissions!"
sudo chmod u+x /usr/local/bin/wings
sudo echo "Permissions Updated!"
sleep 3

# Restarting Wings
sudo echo "Restarting Wings!"
sudo systemctl restart wings

# Send webhook completion message
sudo echo "Changing to Dendency Directory!"
cd /home/sneaky-scripts/dependencies/discord.sh-1.5
sudo ./discord.sh --webhook-url=WEBHOOKURL --text "EXAMPLE TEXT"
sudo echo "Discord Webhook Message Sent!"

# Finish Message
echo "==================================================="
echo ""
echo "                 Update Completed!"
echo "                 Made with Love <3"
echo "                   Version: 1.0"
echo ""
echo "==================================================="