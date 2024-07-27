#!/bin/sh

# Create ngrok config file for auth token
if [ -n "$NGROK_AUTHTOKEN" ]; then
    echo "authtoken: $NGROK_AUTHTOKEN" > /home/ngrokuser/.ngrok2/ngrok.yml
fi

# Substitute environment variables in the ngrok config file template
envsubst < /home/ngrokuser/ngrok.yml.template >> /home/ngrokuser/.ngrok2/ngrok.yml

# Start ngrok with the generated config file
ngrok start --config /home/ngrokuser/.ngrok2/ngrok.yml --all

