// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("DegenToken", "DGN") {}

    event Minted(address indexed to, uint256 amount);
    event Burned(address indexed sender, uint256 amount);
    event Redeemed(address indexed sender, string item);

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function showGameStore() public pure returns(string memory) {
        return  "Welcome to the item shop.\n1. Health Plus - 50 Degen\n2. Mana Plus - 75 Degen\n3. Armor Plus - 100 Degen\n";
    }

    function redeem(uint256 choice) external {
        if (choice < 0 || choice > 3) {
            revert("Invalid choice.");
        }

        if (choice == 1) {
            require(balanceOf(msg.sender) >= 50, "Insufficient balance");
            approve(msg.sender, 50);
            transferFrom(msg.sender, owner(), 50);
            emit Redeemed(msg.sender, "Health Plus");
        } else if (choice == 2) {
            require(balanceOf(msg.sender) >= 75, "Insufficient balance");
            approve(msg.sender, 75);
            transferFrom(msg.sender, owner(), 75);
            emit Redeemed(msg.sender, "Mana Plus");
        } else if (choice == 3) {
            require(balanceOf(msg.sender) >= 100, "Insufficient balance");
            approve(msg.sender, 100);
            transferFrom(msg.sender, owner(), 100);
            emit Redeemed(msg.sender, "Armor Plus");
        }
    }

    function balance() external view returns(uint256) {
        return balanceOf(msg.sender);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(amount <= balanceOf(msg.sender), "Not enough tokens");
        return super.transfer(to, amount);
    }

    function transferFrom(address sender, address to, uint256 amount) public override returns (bool) {
        approve(msg.sender, amount);
        return super.transferFrom(sender, to, amount);
    }
}
