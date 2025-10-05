FROM alpine:latest

# Install git and openssh-client
RUN apk update && apk add --no-cache git openssh-client

# Create a directory for ssh keys
RUN mkdir -p /root/.ssh/

# Copy the SSH keys into the image
COPY keys/id_rsa /root/.ssh/id_rsa
COPY keys/id_ed25519 /root/.ssh/id_ed25519
RUN chmod 600 /root/.ssh/id_rsa /root/.ssh/id_ed25519

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]