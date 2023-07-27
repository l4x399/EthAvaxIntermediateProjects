// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
    REQUIREMENTS
    Functionality

    Contract successfully uses require()
    Contract successfully uses assert()
    Contract successfully uses revert() statements

    Explanation

    Code read-aloud is submitted
    Code read-aloud is complete (all steps explained)
    Code read-aloud is clear and understandable
*/

contract ErrorHandling {
    uint public x = 0;

    function doRequire(uint _value) public payable {
        require(_value >= 100, "Given value must be greater than or equal to 100");
        x += _value;
    }

    function doRevert(uint _value) public payable {
        if (_value > x) {
            revert("Given value must be less than/equal to the value of x");
        }
        x -= _value;
    }

    function doAssert(uint _value) public view returns (bool) {
        assert(_value <= x);
        return true;
    }
}
