// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//import "hardhat/console.sol";

contract Assessment {
    address payable public owner;
    uint256 public balance;

    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);
    event Multiplied(uint256 amount);
    event Divided(uint256 amount);

    constructor(uint initBalance) payable {
        owner = payable(msg.sender);
        balance = initBalance;
    }

    function getBalance() public view returns(uint256){
        return balance;
    }

    function deposit(uint256 _amount) public payable {
        uint _previousBalance = balance;

        // make sure this is the owner
        require(msg.sender == owner, "You are not the owner of this account");

        // perform transaction
        balance += _amount;

        // assert transaction completed successfully
        assert(balance == _previousBalance + _amount);

        // emit the event
        emit Deposit(_amount);
    }

    // custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdraw(uint256 _withdrawAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        uint _previousBalance = balance;
        if (balance < _withdrawAmount) {
            revert InsufficientBalance({
                balance: balance,
                withdrawAmount: _withdrawAmount
            });
        }

        // withdraw the given amount
        balance -= _withdrawAmount;

        // assert the balance is correct
        assert(balance == (_previousBalance - _withdrawAmount));

        // emit the event
        emit Withdraw(_withdrawAmount);
    }

    error UpperLimit(uint256 amount);

    function multiply(uint256 _multiplyAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        uint _previousBalance = balance;
        if (_multiplyAmount > 10) {
            revert UpperLimit({
                amount: _multiplyAmount
            });
        }

        balance *= _multiplyAmount;

        assert(balance == (_previousBalance * _multiplyAmount));

        emit Multiplied(_multiplyAmount);
    }

    error InvalidOperation(uint256 balance, uint256 divideAmount);

    function divide(uint256 _divideAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        uint _previousBalance = balance;
        if (_divideAmount < 1) {
            revert InvalidOperation({
                balance: _previousBalance,
                divideAmount: _divideAmount
            });
        }

        balance /= _divideAmount;

        assert(balance == (_previousBalance / _divideAmount));

        emit Divided(_divideAmount);
    }
}
