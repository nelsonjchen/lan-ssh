# Aborted

> [!NOTE]
> This project has been aborted since GitHub unverifies or removes SSH keys that have their private keys publicly available. I am unable to find an API to prevent this from happening. As such, this project is mothballed and a testament to the futility of trying to share SSH keys publicly. Hah!

# LAN-SSH

https://github.com/lan-ssh

A *public* SSH Key for access to your LAN devices that take GitHub user accounts to authenticate over SSH.

## Usage

The keys can be found underneath the [keys](./keys) directory.

The public keys have been pre-installed into the [lan-ssh GitHub account](https://github.com/lan-ssh). When you set up a device that supports GitHub user accounts for SSH authentication, you can use the username `lan-ssh` to log in with either of the keys in this repo.

## Software/Hardware that supports GitHub user accounts for SSH authentication

* [comma.ai Devices](https://comma.ai/)
* Ubuntu Installer
* I'm sure there are others, please open an issue or PR to add to this list!

## Design

* `keys/id_ed25519` - ED25519 Private Key (shared)
* `keys/id_ed25519.pub` - ED25519 Public Key
* `keys/id_rsa` - RSA Private Key (shared)
* `keys/id_rsa.pub` - RSA Public Key

This repo will also periodically use the keys to keep them active on GitHub.