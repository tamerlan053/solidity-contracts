//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract StructMapping {
    mapping (address => uint) public balance;
    mapping(address => bool) public isAllowedToSend;

    address payable nextOwner;

    constructor() {
        owner = payable(msg.sender);
    }

    function contractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function transfer(uint amount) public {
        require(msg.sender == owner, "You are not the owner!");
    }

    receive() external payable{}
 }