#!/bin/sh

# Add github.com to known_hosts to avoid interactive prompt
ssh-keyscan github.com >> /root/.ssh/known_hosts

# Perform the git operations
echo "Cloning with RSA key..."
GIT_SSH_COMMAND='ssh -i /root/.ssh/id_rsa -o IdentitiesOnly=yes' git clone git@github.com:nelsonjchen/lan-ssh.git ./temp_clone_rsa
rm -rf ./temp_clone_rsa

echo "Cloning with ED25519 key..."
GIT_SSH_COMMAND='ssh -i /root/.ssh/id_ed25519 -o IdentitiesOnly=yes' git clone git@github.com:nelsonjchen/lan-ssh.git ./temp_clone_ed25519
rm -rf ./temp_clone_ed25519

echo "Key refresh complete."