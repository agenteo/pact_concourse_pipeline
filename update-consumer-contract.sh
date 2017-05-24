#!/bin/bash

echo "Updating contract..."

git clone consumer-driven-api-contracts updated-consumer-driven-api-contracts

cp target/pacts/* updated-consumer-driven-api-contracts

diff consumer-driven-api-contracts updated-consumer-driven-api-contracts
CONTRACT_CHANGED=$?

if [ $CONTRACT_CHANGED -gt 0 ]
then
    echo "API contract changed."
    cd updated-consumer-driven-api-contracts
    git config --global user.email "cosumer@example.com"
    git config --global user.name "Consumer updated contract"
    git add .
    git commit -m "Updated contract"
else
    echo "API contract did not change."
    exit 0
fi