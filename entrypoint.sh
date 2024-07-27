#!/bin/sh

# Substitute environment variables in the ngrok config file template
envsubst < /home/ngrokuser/ngrok.yml.template > /home/ngrokuser/.ngrok2/ngrok.yml

# Authenticate ngrok with the provided auth token
if [ -n "$NGROK_AUTHTOKEN" ]; then
    ngrok config add-authtoken $NGROK_AUTHTOKEN --config /home/ngrokuser/.ngrok2/ngrok.yml
fi

# Start ngrok with the generated config file
ngrok start --config /home/ngrokuser/.ngrok2/ngrok.yml --all

