// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract KingOfEtherPull{
    address public king;
    uint public balance;

    mapping (address => uint) balances;

    constructor() payable {
        king = msg.sender;
        balance = msg.value;
    }

    function claimThrone() public payable{
        require(msg.value > balance, "You need to send more ether");
        balances[king] += balance;

        king = msg.sender;
        balance = msg.value;
    }

    function withdrwal (uint amount) public {
        require(balances[msg.sender] >= amount, "You don't have enough ether");
        balances[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed.");
    }

}