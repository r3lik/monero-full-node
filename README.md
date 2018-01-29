# Monero-full-node

Run the XMR fullnode in a Docker container that is provisioned with Vagrant and Ansible.

## Requirements

- Vagrant
- Vagrant-disksize

```
vagrant plugin install vagrant-disksize
```

## Usage

Dockerfile gets provisioned to `/vagrant/storage/Dockerfile`
 

       # create volume
        sudo docker volume create monero-blockchain
     
        # either run in foreground
        sudo docker run --name monerod -v monero-blockchain:/root/.bitmonero -it r3lik/monero-full-node

        # or in background
        sudo docker run -d --name monerod -v monero-blockchain:/root/.bitmonero -it r3lik/monero-full-node
