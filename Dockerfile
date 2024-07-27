FROM alpine:latest
ENV MIGET_SERVICE_PORT=5000
ENV MIGET_SERVICE_NAME=localhost
ENV NGROK_AUTHTOKEN=
RUN apk update && apk add --no-cache wget ca-certificates && \
    wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar -xzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin && \
    rm ngrok-v3-stable-linux-amd64.tgz
RUN mkdir -p /etc/ngrok
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY ngrok.yml.template /ngrok.yml.template
ENTRYPOINT ["/entrypoint.sh"]

