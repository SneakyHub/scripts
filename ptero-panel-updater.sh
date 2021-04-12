#!/bin/bash

sudo echo "==================================================="
sudo echo ""
sudo echo "Thank you for using Sneaky's Ptero Auto Updater! <3"
sudo echo ""
sudo echo "              Made with Love <3"
sudo echo "      Made for and tested on Ubuntu 18.04"
sudo echo "          Auto Updating Ptero Panel"
sudo echo ""
sudo echo ""
sudo echo "        THIS SCRIPT WILL START IN 30 SECONDS"
sudo echo "      DO CTRL + C TO CANCEL IF RAN BY MISTAKE!!"
sudo echo ""
sudo echo "==================================================="

sleep 30

# Base Directory
sudo echo "Moving to Base Directory to start Update Process."
cd /var/www/pterodactyl
sleep 3

# Entering Maintenance
sudo echo "Entering Maintenance Mode."
sudo php artisan down
sleep 3

# Downloading Update
sudo echo "Downloading Update Files."
sudo curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar -xzv
sudo echo "Download Completed!"
sleep 3

# Updating Permissions
sudo echo "Moving onto updating permissions!"
sudo chmod -R 755 storage/* bootstrap/cache
sudo echo "Permissions Updated!"
sleep 3

# Updating Dependencies
sudo echo "Updating Dependencies!"
sudo composer install --no-dev --no-interaction --optimize-autoloader
sudo echo "Dependencies Updated!"
sleep 3

# Clearing Cache
sudo echo "Clearing Cache!"
sudo php artisan view:clear
sudo php artisan config:clear
sudo echo "Cache Cleared!"
sleep 3

# Updating Database
sudo echo "Updating Database!"
sudo php artisan migrate --seed --force
sudo echo "Database Update Completed!"
sleep 3

# Update Webserver Permissions
sudo echo "Setting Webserver Permissions!"
sudo chown -R www-data:www-data /var/www/pterodactyl/*
sudo echo "Webserver Permissions Set!"
sleep 3

# Queue Workers
sudo echo "Restarting Queue Workers!"
sudo php artisan queue:restart
sudo echo "Queue Workers Restarted!"
sleep 3

# Exit Maintenance Mode
sudo echo "Exiting Maintenance Mode!"
sudo php artisan up


# Finish Message
sudo echo "==================================================="
sudo echo ""
sudo echo "                 Update Completed!"
sudo echo "                 Made with Love <3"
sudo echo "                   Version: 1.0"
sudo echo ""
sudo echo "==================================================="
