#!/bin/bash

IP=${IP:-$(awk 'END{print $1}' /etc/hosts)}
PORT=${PORT:-80}

echo "Starting fibridge..."
echo "IP: $IP"
echo "Port: $PORT"
echo ""

./fibridge-rs --ip-address $IP --port $PORT