# docker-lotus

Builds and publishes docker images for the Lotus full node software.

Get help on the official [Lotus Telegram channel](https://t.me/givelotus).

## Run on a Docker host

```sh
git clone https://github.com/sondreb/docker-lotus.git
sudo docker-compose up -d
```

That's all you need to do, to run a basic instance of the Lotus full node. Have a look at the volume configuration and lotus.conf to customer your set. Check out the [docker-compose.yml](docker-compose.yml) file.

## Customize configuration

Put a copy of the "lotus.conf" on this path, to have it be copied and override the default:

`/home/bitcoin/config/lotus.conf`

## Create new release

To create a new release, simply make an GitHub release and specify the version number as a label. When published, it will trigger GitHub Workflow that will publish to Docker Hub.

## Run from Dockerfile

If you don't want to use the Docker Hub published image, you can build and run it locally by navigating to the `mainnet` folder and run:

```sh
sudo docker-compose up -d
```

This will build based on the [mainnet/Dockerfile](mainnet/Dockerfile).

## Installation and Usage



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

## License

[MIT License](LICENSE.md)
