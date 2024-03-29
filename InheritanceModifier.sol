//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.15;

contract InheritanceModifier {
    mapping (address => uint) public tokenBalance; 

    address owner; 

    uint tokenPrice = 1 ether; 

    constructor() {
        owner = msg.sender; 
        tokenBalance[owner] = 100;
    }

    modifier onlyOwner() {
        require (msg.sender == owner, "You are not the owner");
        _;
    } 

    function createNewtoken() public onlyOwner {
        tokenBalance[owner]++;
    }

    function burnToken() public onlyOwner {
        tokenBalance[owner]++;
    }

    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough tokens");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "not enough tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }
}
