#!/bin/bash

sudo echo "==================================================="
sudo echo ""
sudo echo "Thank you for using Sneaky's System Cleanup Script! <3"
sudo echo ""
sudo echo "              Made with Love <3"
sudo echo "      Made for and tested on Ubuntu 18.04"
sudo echo ""
sudo echo ""
sudo echo "        THIS SCRIPT WILL START IN 30 SECONDS"
sudo echo "      DO CTRL + C TO CANCEL IF RAN BY MISTAKE!!"
sudo echo ""
sudo echo "==================================================="

sleep 3

# Cleanup Commands
sudo echo "Running System Cleanup Commands."
sudo sync; echo 3 > /proc/sys/vm/drop_caches
sleep 3

# Send webhook completion message
sudo echo "Changing to Dendency Directory!"
cd /home/sneaky-scripts/dependencies/discord.sh-1.5
sudo ./discord.sh --webhook-url=WEBHOOKURL --text "example text"
sudo echo "Discord Webhook Message Sent!"

# Finish Message
echo "==================================================="
echo ""
echo "             System Cleanup Completed!"
echo "                 Made with Love <3"
echo "                   Version: 1.0"
echo ""
echo "==================================================="