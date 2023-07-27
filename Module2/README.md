# Eth+Avax Module 2 Project

This repository is for the Module 2 project output for ETH + AVAX: Intermediate EVM Course in Metacrafters. VSCode is used for this project.

## Description

In this project, I expand the SCM Starter Project which is a simple frontend for depositing and withdrawing 1 ETH from a Hardhat node. I name it the Metacrafters ATM Calculator, since the added functions are two operations that complete the four basic operations of a calculator: Add on deposit, Subtract on withdraw, and the two added functions Multiply and Divide. I have added four number forms for the frontend to enter the number for operation. When the button is pressed, the transaction will start to get processed to the connected Metamask wallet. It also has checks for whether the operation will be valid or not and will revert if the operation is invalid. This can be seen on the withdraw and divide functions in the contract. Both the JavaScript for the frontend and the Solidity contract for the backend have been modified to make this project work. All of the tests are also done locally.

## Getting started

### Installing

- The GitHub repo is cloned to the computer to be run as a local copy.

### Executing program

After cloning the GitHub repo, do the following to get the code running locally.

1. Open three terminals to work on, and set the project directory as the work directory.
1. In the first terminal, type: npm install
1. In the second terminal type: npx hardhat node
1. In the third terminal, type: npx hardhat run --network localhost scripts/deploy.js
1. Go back to the first terminal, and type: npm run dev
1. This should launch the front-end.

After this, the project will be running on http://localhost:3000/

## Authors

l4x399 at GitHub

## License

This project is licensed under the MIT License - see the LICENSE file for details
