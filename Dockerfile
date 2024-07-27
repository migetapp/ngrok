# Use an official lightweight Alpine Linux image
FROM alpine:latest

# Set environment variables
ENV SERVICE_PORT=8080
ENV SERVICE_NAME=localhost
ENV NGROK_AUTHTOKEN=

# Install ngrok and other necessary tools
RUN apk update && apk add --no-cache wget ca-certificates && \
    wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar -xzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin && \
    rm ngrok-v3-stable-linux-amd64.tgz

# Create a non-root user with UID 1000
RUN adduser -D -u 1000 ngrokuser

# Create ngrok config directory in the user's home directory
RUN mkdir -p /home/ngrokuser/.ngrok2

# Copy entrypoint script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Copy ngrok config template
COPY ngrok.yml.template /home/ngrokuser/ngrok.yml.template

# Change ownership of the ngrok config directory and template file
RUN chown -R ngrokuser:ngrokuser /home/ngrokuser/.ngrok2 /home/ngrokuser/ngrok.yml.template

# Switch to the non-root user
USER ngrokuser

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

