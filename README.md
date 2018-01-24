* Docker
        
        # create volume
        sudo docker volume create monero-blockchain
     
        # either run in foreground
        sudo docker run --name monerod -v monero-blockchain:/root/.bitmonero -it r3lik/monero-full-node

        # or in background
        sudo docker run -d --name monerod -v monero-blockchain:/root/.bitmonero -it r3lik/monero-full-node
