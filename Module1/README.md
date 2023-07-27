# Eth+Avax Module 1 Project

This repository is for the Module 1 project output for ETH + AVAX: Intermediate EVM Course in Metacrafters. Remix Ethereum IDE is used for this project.

## Description

`ErrorHandling.sol` fulfills the requirements for creating a contract with the following Solidity syntax features used:
- The `require()` error check used in the `doRequire()` function. This function needs one argument, and the require function is used to check if the passed value is greater than or equal to 100. If it passes, the given value is added to the global variable x.
- The `revert()` error check used in the `doRevert()` function. This function needs one argument, and checks if the value passed is greater than the global variable x. If the condition is true, revert is called. If not, the function will proceed and given value is subtracted from the global variable x.
- The `assert()` error check used in the `doAssert()` function. This function needs one argument and returns a boolean. The assert checks if the passed value is less than or equal to the variable x. If it passes, the function will proceed and return true.

## Getting Started

### Installing

* There is only one file for this project, `ErrorHandling.sol`, which can be downloaded and imported to the Remix Ethereum IDE.

### Executing program

* Go to the Remix Ethereum IDE in here: https://remix.ethereum.org/
* To run the program, download `ErrorHandling.sol` and import it into Remix by clicking Open File. This should add the file into the workspace.
* Open `ErrorHandling.sol` and go to the Solidity Compiler at the left side of the page. Click Auto-compile and Compile script.
* Go to Deploy and run transactions, and click Deploy. The contract is then deployed as it can be seen in the Deployed Contracts section.
* The functions can now be tested, and variable values can now be checked within the deployed contract.

## Authors

l4x399 at GitHub

## License

This project is licensed under the MIT License - see the LICENSE file for details
