# docker-lotus

A Lotus full node based on the Lotus reference client. Currently there is only a testnet available and the binary for running the node must be manually downloaded. Help for setting up a node can be found in [the Lotus Telegram channel](https://t.me/givelotus).

# Installation and Usage

- It's assumed that you are starting with a fresh installation of Ubuntu 18.04
  LTS on a 64-bit machine. It's also assumed that you are installing as
  a [non-root user with sudo privileges](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04).

- Install Docker on the host
  system. [This tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04) shows
  how to install Docker on a Ubuntu system. It's specifically targeted to Digital
  Ocean's cloud servers, but should work for any Ubuntnu system.

- Install Docker Compose too. [This tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04)
  shows how to do so on a Ubuntu system.

- Clone this repository in your home directory with the following command:

`git clone https://github.com/christroutner/docker-lotus`

- Create a two directories for the config files and blockchain data. It should follow this directory structure:

```
├── /home/yourUserName/lotus/
│   ├── docker-lotus          # This repository
│   │   ├── mainnet/
│   │   ├── testnet/
│   ├── testnet/
│   │   ├── config/           # Configuration settings
│   │   ├── blockchain-data/  # Blockchain data
```

- Copy the [run-script.sh](run-script.sh) and [lotus.conf](lotus.conf) file
  into the `config` directory you just created. Customize the lotus.conf file for
  your own full node.

- Enter the `docker-lotus` directory and start the container with this command:

`docker-compose up -d`

- Check on the status of lotusd as it syncs to the blockchain:

`sudo tail ../blockchain-data/testnet3/debug.log`

- Or query the JSON RPC:

`curl --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getnetworkinfo","params":[]}' -H 'content-type:text/plain;' http://lotus:lotus@127.0.0.1:11604/`

`curl --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getblockchaininfo","params":[]}' -H 'content-type:text/plain;' http://lotus:lotus@127.0.0.1:11604/`

### Customization

- Customize the `volumes` setting in the [docker-compose.yml](docker-compose.yml)
  file in order to choose where you want the blockchain data and config files stored.

- Edit the lotus.conf file in the `config` directory and restart the container
  if you need to change the configuration settings for the full node.

## Testnet

Currently only testnet is available.

# License

[MIT License](LICENSE.md)
