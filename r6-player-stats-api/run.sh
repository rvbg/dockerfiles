#!/bin/bash

# Download api. Will not override old folder.
cd /var/www/html
git clone https://github.com/Seems2Legit/Rainbow-Six-Siege-Player-Stats-API /var/www/html

# Check and set env variables.
if [ -z "$APPCODE" ]; then
        echo "Appcode is not set! Exiting."
        exit 1
fi

if [ -z "$EMAIL" ]; then
        echo "Ubisoft Email is not set! Exiting."
        exit 1
fi

if [ -z "$PASSWORD" ]; then
        echo "Ubisoft Password is not set! Exiting."
        exit 1
fi

REGION=${REGION:-emea}
STATS=${STATS:-casualpvp_death}
PLATFORM=${PLATFORM:-uplay}
PROGRESSION=${PROGRESSION:-true}

# Generate new config file from env variables.
rm config.php
cat >config.php << EOF
<?php
\$config = array(
        "appcode" => "$APPCODE",
        "ubi-email" => "$EMAIL",
        "ubi-password" => "$PASSWORD",
        "default-region" => "$REGION",
        "default-stats" => "$STATS",
        "default-platform" => "$PLATFORM",
        "default-progression" => "$PROGRESSION"
);
?>
EOF
echo "Created new config file"

# Give the webserver permissions to edit the api_ticket file.
chmod 777 api_ticket

# Start apache server.
echo "Starting apache..."
apache2-foreground