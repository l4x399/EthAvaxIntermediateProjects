# Eth+Avax Module 4 Project

This repository is for the Module 4 project output for ETH + AVAX: Intermediate EVM Course in Metacrafters. VSCode is used for this project.

## Description

In this project, I will be creating an ERC-20 compliant token for Degen Gaming and deploy it to the Avalanche Fuji testnet. In this smart contract, players should be able to transfer tokens, redeem tokens for game items from the item shop, anyone should be able to burn tokens, and the platform should be able to mint tokens to add to the total supply and distribute the tokens to players.

## Getting Started

### Installing

- The GitHub repo is cloned to the computer to be run as a local copy.

### Executing program

1. Run `npm install` to install dependencies needed by the program
1. Set up Metamask by adding the Avalanche Fuji C-Chain network. Get the private key for the wallet.
1. Set up Snowtrace by creating a new API key to be used. Get the API key here.
1. Modify the `.env` file to place the wallet private key and Snowtrace API key to be used for the project
1. Deploy the contract to the fuji testnet: `npx hardhat run scripts/deploy.js --network fuji`
1. Verify the contract in the fuji testnet: `npx hardhat verify <contract address> --network fuji`
1. Open Remix IDE and import `DegenToken.sol` contract, and compile it
1. Go to Deploy, set environment to `Injected Provider - Metamask`
1. Get the contract address, paste it in and click `At Address`

## Authors

l4x399

## License

This project is licensed under the MIT License - see the LICENSE file for details
