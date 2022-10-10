// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract KingOfEther{
    address public king;
    uint public balance;

    constructor() payable {
        king = msg.sender;
        balance = msg.value;
    }

    function claimThrone() public payable{
        require(msg.value > balance, "You need to send more ether");
        (bool success, ) = king.call{value: balance}("");

        require(success, "Transfer failed.");

        king = msg.sender;
        balance = msg.value;
    }

}