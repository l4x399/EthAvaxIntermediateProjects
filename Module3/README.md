# Eth+Avax Module 3 Project

This repository is for the Module 3 project output for ETH + AVAX: Intermediate EVM Course in Metacrafters. VSCode is used for this project.

## Description

In this project, I will be creating a ERC-20 compliant token to be deployed on a local Hardhat network. To get started, I used the Hardhat Boilerplate Project on their website as a base. Then, I modified the contract solidity code to have our own token named Meta Token (MTA), with OpenZeppelin being used to achieve this. OpenZeppelin is very useful since it provides the base that is needed to create the ERC-20 compliant tokens with the functions that it provides to the project. With it, I can now test the project by deploying the contract, then running the frontend. I provide the primary account (account 0) with preminted MTA tokens using faucet, and then attempt transferring it to a second account with success. The mint and burn functions shall also be tested. Only the owner should be able to mint tokens. Any user will be able to transfer and burn tokens.

## Getting started

### Installing

- The GitHub repo is cloned to the computer to be run as a local copy.

### Executing program

After cloning the GitHub repo, do the following to get the code running locally.

1. Open three terminals to work on, and set the project directory as the work directory.
1. In the first terminal, type: npm install
1. In the second terminal type: npx hardhat node
1. In the third terminal, type: npx hardhat run --network localhost scripts/deploy.js

From here, there are two ways of interacting with the contract. First, let's try the frontend provided in the boilerplate.

1. Go back to the first terminal, and type: cd frontend; npm run start
1. This launches the frontend.

However, this is a bit limited since the only function provided in the boilerplate is transferring tokens. Let's go and connect this to Remix IDE.

1. Go back to the root directory: cd ..
1. Install remixd globally using npm: npm install -g @remix-project/remixd
1. Run remixd: remixd -s ./ --remix-ide https://remix.ethereum.org
1. Go to https://remix.ethereum.org on a web browser
1. Set workspace to connect to localhost
1. Set Deploy environment to Metamask
1. Compile and deploy the contract

With the Remix IDE, you will be able to interact with the contract more freely as it provides a very useful interface to test out the functions.

## Authors

l4x399 at GitHub

## License

This project is licensed under the MIT License - see the LICENSE file for details
