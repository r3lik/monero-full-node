`sudo docker volume create monero-blockchain`
`sudo docker run --name monerod -v monero-blockchain:/root/.bitmonero -t r3lik/monero-full-node`
