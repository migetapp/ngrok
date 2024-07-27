#!/bin/sh

envsubst < /ngrok.yml.template > /etc/ngrok/ngrok.yml
ngrok start --config /etc/ngrok/ngrok.yml --all

